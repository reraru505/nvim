-- ~/.config/nvim/lsp/pyright.lua

return {
  cmd = {'pyright-langserver', '--stdio'}, -- or just {'pyright'} if installed directly via pip
  filetypes = {'python'},
  root_dir = require('lspconfig.util').root_pattern('pyproject.toml', 'setup.py', '.git'),
  -- Add specific pyright settings here if needed
  -- settings = {
  --   python = {
  --     analysis = {
  --       autoSearchPaths = true,
  --       useLibraryCodeForTypes = true,
  --       typeCheckingMode = "basic", -- or "strict"
  --     },
  --   },
  -- },
}
