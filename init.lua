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
 -- Use PowerShell
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Redirect output safely for PowerShell
vim.opt.shellredir = ">$TEMP\\nvimerror 2>&1"
vim.opt.shellpipe = ">"   -- simple redirection works reliably

-- Use make in PATH
vim.opt.makeprg = "make"

