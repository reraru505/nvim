-- ~/.config/nvim/lsp/clangd.lua

return {
  cmd = {'clangd' },
  filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda', 'h'},
  root_dir = require('lspconfig.util').root_pattern('compile_commands.json', '.git' , '.clangd'),
  -- Add specific clangd settings here if needed
  -- arguments = {
  --   '--header-insertion-decorators=0', -- Helps with some issues
  --   '--background-index',
  -- },
}
