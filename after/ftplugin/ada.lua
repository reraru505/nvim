 -- ~/.config/nvim/after/ftplugin/ada.lua

-- Remove the specific mappings causing the Space bar lag
-- We use pcall just in case the mappings don't exist, to avoid errors
pcall(vim.keymap.del, "i", "<Space>aj", { buffer = true })
pcall(vim.keymap.del, "i", "<Space>al", { buffer = true })
