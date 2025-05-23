 -- After your packer.startup block, or in a separate lua file
-- e.g., ~/.config/nvim/lua/lualine_config.lua
-- and then require('lualine_config') in init.lua

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto', -- or 'dracula', 'gruvbox', etc. Match your colorscheme!
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- ... other options
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', 'filetype' },
    lualine_x = { 'encoding', 'fileformat', 'lineending', 'lsp_client_names' , 'lsp_progress' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    -- ...
  },
  extensions = { 'nvim-tree' } -- Example: integrate with nvim-tree
}

-- Example of a custom LSP status component (requires 'nvim-lsp-status' or similar)
-- If you want LSP status like NvChad, you'll likely need another plugin like
-- 'nvim-lsp-status' or configure the default 'diagnostics' component well.
-- For demonstration, let's assume you have a function to get LSP status.
-- This is a placeholder; you'd replace it with actual LSP client information.
-- If you use nvim-lsp-status (a good choice for NvChad-like LSP info):
-- Make sure you're using 'nvim-lsp-status/nvim-lsp-status' plugin as well.
-- Then, you can use:
-- 'lsp_client_names', 'lsp_progress', 'lsp_status_string' as components.
-- For a basic placeholder:
_G.s = _G.s or {}
_G.s.lsp_status = function()
    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
    local clients_names = {}
    for _, client in ipairs(buf_clients) do
        table.insert(clients_names, client.name)
    end
    if #clients_names > 0 then
        return table.concat(clients_names, ', ') .. ' ' -- Example icon
    else
        return ''
    end
end
