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
