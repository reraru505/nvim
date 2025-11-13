if vim.fn.executable('win32yank.exe') == 1 then
	vim.g.clipboard = {
		name = 'win32yank',
		copy = {["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf"},
		paste = {["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf"},
		cache_enabled = 0,
	}
end


require("remap")
require("telescope-config")
require("packer-config")
require("lsp-config")
require("completion")
vim.opt.number = true
--vim.opt.relativenumber = true 

vim.cmd("colorscheme kanagawa")
--vim.cmd.colorscheme("gruber-darker")
vim.opt.clipboard = 'unnamedplus'
vim.opt.virtualedit = 'all' 

require('lauline-conf')
require('autopairs-conf')

--require("lsp-config")
vim.opt.shell = [["C:/Program Files/Git/bin/bash.exe"]]
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = '"'
vim.opt.shellxquote = ""
 -- Normalize temporary files for bash on Windows
vim.opt.shellredir = ">%s 2>&1"
vim.opt.shellpipe = "2>&1| tee"
vim.opt.shellslash = true
