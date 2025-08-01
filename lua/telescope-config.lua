vim.g.mapleader = " "
vim.keymap.set("n" , "<leader>d" , vim.cmd.Ex)


local builtin = require('telescope.builtin')

-- Telescope settings
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>/', function()

	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

vim.keymap.set('n' , '<leader>b' , function() 
	builtin.buffers();
end)

require("nvim-tree").setup()

vim.keymap.set('n' , '<leader>t' , '<cmd>NvimTreeToggle<CR>' , {noremap = true} )

vim.keymap.set('n' , '<leader>w' , '<C-w>w' )
