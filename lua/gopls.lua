-- ~/.config/nvim/lsp/gopls.lua

return {
  cmd = {'gopls'},
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
  root_dir = require('lspconfig.util').root_pattern('go.mod', '.git'),
  -- Add specific gopls settings here if needed
  -- settings = {
  --   gopls = {
  --     buildFlags = {'-tags=wireinject'},
  --     staticcheck = true,
  --   },
  -- },
}
