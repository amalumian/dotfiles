const assert = require("node:assert/strict");
const { execFileSync } = require("node:child_process");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const { test } = require("node:test");

const hook = path.join(__dirname, "hooks/prepare-commit-msg");
function fixture(t) {
  const cwd = fs.mkdtempSync(path.join(os.tmpdir(), "dotfiles-hook-"));
  t.after(() => fs.rmSync(cwd, { recursive: true, force: true }));
  const env = { ...process.env, GIT_CONFIG_GLOBAL: "/dev/null", GIT_CONFIG_NOSYSTEM: "1" };
  const git = (...args) => execFileSync("git", args, { cwd, env, encoding: "utf8", stdio: ["ignore", "pipe", "pipe"] });
  const write = (file, text = file) => {
    fs.mkdirSync(path.dirname(path.join(cwd, file)), { recursive: true });
    fs.writeFileSync(path.join(cwd, file), text);
  };
  git("init", "--quiet");
  git("config", "user.name", "Test");
  git("config", "user.email", "test@example.com");
  git("config", "core.hooksPath", path.dirname(hook));
  const run = (source, original = "# Git comments\n") => {
    const file = path.join(cwd, ".git/COMMIT_EDITMSG");
    fs.writeFileSync(file, original);
    execFileSync(process.execPath, [hook, file, ...(source ? [source] : [])], { cwd, env });
    return fs.readFileSync(file, "utf8");
  };
  return { cwd, git, write, run };
}

test("groups staged changes by tool, including cross-tool renames and type changes", (t) => {
  const { cwd, git, write, run } = fixture(t);
  write("nvim/old name.lua", "unique rename content\n");
  write("zsh/zshrc", "before\n");
  write("bat/removed", "delete me\n");
  write("tmux/config", "type change\n");
  git("add", ".");
  git("commit", "--quiet", "-m", "initial");
  fs.mkdirSync(path.join(cwd, "git"), { recursive: true });
  git("mv", "nvim/old name.lua", "git/new name.lua");
  write("zsh/zshrc", "after\n");
  git("rm", "bat/removed");
  fs.unlinkSync(path.join(cwd, "tmux/config"));
  fs.symlinkSync("../zsh/zshrc", path.join(cwd, "tmux/config"));
  write("mise/новый файл.toml");
  write("mise/tab\tfile.toml");
  git("add", ".");
  write("zsh/unstaged", "must not appear");
  const message = run();
  assert.match(message, /^Add to mise; Modify in tmux, zsh; Rename in nvim, git; Delete from bat\n/);
  assert.match(message, /nvim\/old name\.lua -> git\/new name\.lua/);
  assert.match(message, /mise\/новый файл\.toml/);
  assert.ok(message.includes('"mise/tab\\tfile.toml"'));
  assert.ok(!message.includes("unstaged"));
  assert.ok(message.endsWith("# Git comments\n"));
});

test("leaves explicit messages, templates, merge and amend sources untouched", (t) => {
  const { git, write, run } = fixture(t);
  write("mise.toml");
  git("add", ".");
  for (const source of ["message", "template", "merge", "squash", "commit"]) {
    assert.equal(run(source, "My message\n"), "My message\n");
  }
  git("commit", "--quiet", "-m", "Explicit message");
  assert.equal(git("log", "-1", "--format=%s").trim(), "Explicit message");
});

test("leaves an empty index untouched and summarizes the initial commit", (t) => {
  const { git, write, run } = fixture(t);
  assert.equal(run(), "# Git comments\n");
  write("README.md");
  git("add", "README.md");
  assert.match(run(), /^Add to README\.md\n\nAdded:\n  - README\.md/);
});
