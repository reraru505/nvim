local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind') -- For icons

cmp.setup({
  snippet = {
    -- REQUIRED - A snippet engine like LuaSnip is required
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- Navigate completion menu
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }), -- 'i' for insert mode, 's' for snippet mode

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP signals from `nvim-lspconfig`
    { name = 'luasnip' },  -- Snippets from `LuaSnip`
    { name = 'buffer' },   -- Words from current buffer
    { name = 'path' },     -- File system paths
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- show name of source e.g. "nvim_lsp"
      maxwidth = 50,    -- prevent the popup from showing more than 50 characters
      ellipsis_char = '...', -- when popup menu is too long, show this instead
      -- The `name` is shown when `with_text` is `true`
      -- `menu` is shown when `with_text` is `false`
      -- for example you could show "LSP" instead of "nvim_lsp"
      before = function(entry, vim_item)
        -- Source shown as: (Type: Text)
        -- e.g. (Function: some_function)
        vim_item.menu = ({
          nvim_lsp = '[LSP]',
          luasnip = '[Snippet]',
          buffer = '[Buffer]',
          path = '[Path]',
        })[entry.source.name]
        return vim_item
      end,
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- Set up autocompletion for Command-line mode (e.g. for searching files with Telescope)
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'buffer' }
  })
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})
