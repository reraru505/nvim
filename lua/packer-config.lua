local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'rebelot/kanagawa.nvim'

	-- START: Add these lines for Autocompletion
	use 'hrsh7th/nvim-cmp'             -- The completion plugin
	use 'hrsh7th/cmp-nvim-lsp'         -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip'     -- Snippet source for nvim-cmp
	use 'L3MON4D3/LuaSnip'             -- Snippet engine
	use 'hrsh7th/cmp-buffer'           -- Buffer words source
	use 'hrsh7th/cmp-path'             -- File path source
	use 'onsails/lspkind.nvim'         -- For nice LSP kind icons in completion menu
	use 'j-hui/fidget.nvim'            -- LSP progress notifications (optional, but nice to have)
	-- END: Add these lines for Autocompletion
	-- Automatically install missing plugins on startup

	use 'windwp/nvim-autopairs'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

