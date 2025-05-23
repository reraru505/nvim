-- ~/.config/nvim/init.lua (after your packer.startup block, or in a separate module)

-- Mason: The LSP server installer/manager
require('mason').setup({
  -- Optional: Customize Mason's UI or behavior
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Mason-LSPconfig: Bridges Mason's installed servers with nvim-lspconfig's defaults.
-- This part remains identical to the lazy.nvim setup.
require('mason-lspconfig').setup({
  ensure_installed = {
    "rust_analyzer", -- Rust
    "gopls",         -- Go
    "pyright",       -- Python
    "clangd",        -- C/C++
  },
  -- You can still use setup_handlers here for common on_attach keymaps,
  -- or manage on_attach centrally as shown below for the v0.11+ style.
})

-- --- LSP Server Setup Handlers (using the new vim.lsp.enable() style) ---
-- This section remains exactly the same as provided in the v0.11+ example.
-- It works independently of whether Packer or Lazy manages the plugins.

local on_attach_callback = function(client, bufnr)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    -- Basic LSP keymaps
    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    -- Diagnostic keymaps
    buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

-- A helper function to enable an LSP server and attach common keymaps
local setup_lsp_server = function(server_name)
    -- Load the server's configuration from ~/.config/nvim/lsp/<server_name>.lua
    local server_config = require(server_name)

    -- Merge the common on_attach callback
    server_config.on_attach = function(client, bufnr)
        on_attach_callback(client, bufnr) -- Call your general keymap setup
        -- You can add server-specific on_attach logic here if needed
    end

    -- Enable the LSP server with its configuration
    vim.lsp.enable(server_name, server_config)
end

-- Enable the specific servers you want
setup_lsp_server('rust_analyzer')
setup_lsp_server('gopls')
setup_lsp_server('pyright')
setup_lsp_server('clangd')


-- ... (Remainder of your Neovim Configuration, transparency function call, etc.) ...
