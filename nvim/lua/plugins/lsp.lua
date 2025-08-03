-- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting

return {
  -- "neovim/nvim-lspconfig",
  -- opts = {
  --   servers = { eslint = {} },
  --   setup = {
  --     eslint = function()
  --       require("lazyvim.util").lsp.on_attach(function(client)
  --         if client.name == "eslint" then
  --           client.server_capabilities.documentFormattingProvider = true
  --         elseif client.name == "tsserver" then
  --           client.server_capabilities.documentFormattingProvider = false
  --         end
  --       end)
  --     end,
  --   },
  -- },
}
