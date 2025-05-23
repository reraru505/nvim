-- lua/myconfig/transparency.lua

-- This file defines a function to set Neovim's background to transparent.
-- It works by setting the 'guibg' (GUI background) and 'ctermbg' (terminal background)
-- of various highlight groups to 'none', allowing the terminal's transparency to show through.

local M = {} -- Create a module table to export functions

function M.set_transparent_background()
    -- Enable true color support, which is necessary for proper transparency
    vim.opt.termguicolors = true

    -- Set background for core editor elements to 'none'
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })          -- Main editor background
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })        -- Background of inactive windows/splits
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })      -- Column for git signs, diagnostics
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })     -- For the '~' lines at the end of the buffer
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })      -- Column for code folding indicators
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = 'none' })     -- Background for 'colorcolumn' if set

    -- Set background for floating windows (like Telescope, Mason, LSP info)
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })     -- Background of floating windows
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })     -- Border of floating windows

    -- You might need to add other highlight groups here depending on your plugins
    -- To find more groups, use `:hi` or `:highlight` in Neovim and look for 'guibg' or 'ctermbg'
    -- For example, if your statusline or tabline isn't transparent:
    -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
end

return M -- Export the module table
