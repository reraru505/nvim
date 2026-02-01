  -- ~/.config/nvim/lua/ada_lsp.lua

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- 1. MANUALLY DEFINE 'als'
-- This block fixes the "config not found" error by teaching lspconfig what 'als' is.
if not configs.als then
  configs.als = {
    default_config = {
      cmd = { "ada_language_server" },
      filetypes = { "ada", "adb", "ads", "gpr" },
      -- Look for .gpr file or .git folder to decide where the project root is
      root_dir = lspconfig.util.root_pattern("*.gpr", ".git", "Makefile"),
      settings = {},
    },
  }
end

-- 2. Standard Keymaps
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    -- Add other keymaps here if you need them
end

-- 3. Capabilities (for nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

-- 4. Setup the Server
lspconfig.als.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- We re-state the command to be safe
    cmd = { "ada_language_server" }, 
    settings = {
        ada = {
            projectFile = "default.gpr", -- Ensure this file exists in your project!
        },
    },
})

print("Ada LSP manually registered and loaded.")
