require("remap")
require("telescope-config")
require("packer-config")
require("lsp-config")
require("completion")
vim.opt.number = true
--vim.opt.relativenumber = true 

vim.cmd("colorscheme kanagawa")
--vim.cmd.colorscheme("gruber-darker")
--vim.opt.clipboard = 'unnamedplus'
vim.opt.virtualedit = 'all' 

require('lauline-conf')
require('autopairs-conf')

--require("lsp-config")

