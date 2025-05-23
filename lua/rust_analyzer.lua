-- ~/.config/nvim/lsp/rust_analyzer.lua

return {
  cmd = {'rust-analyzer'},
  filetypes = {'rust'},
  root_dir = require('lspconfig.util').root_pattern('Cargo.toml', '.git'),
  -- You can add specific settings for rust-analyzer here if needed
  -- settings = {
  --   ['rust-analyzer'] = {
  --     checkOnSave = {
  --       command = 'clippy',
  --     },
  --   },
  -- },
}
