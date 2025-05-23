local autopairs = require('nvim-autopairs')
local cmp = require('cmp') -- Make sure cmp is required here

autopairs.setup({
  -- Default settings are usually good enough for most users
  -- You can uncomment and modify these if needed:

  -- map_bs = true,           -- Map Backspace to delete auto-inserted pairs
  -- map_c_h = false,         -- Map C-h to delete pairs (useful if C-h is also mapped to something else)
  -- map_c_w = false,         -- Map C-w to delete pairs (useful if C-w is also mapped to something else)
  -- disable_filetype = { "TelescopePrompt", "vim" }, -- Disable in specific filetypes
  -- disable_in_macro = true, -- Disable during macro recording
  -- disable_jsx_attr = false, -- Disable for JSX attributes
  -- enable_check_bracket_line = false, -- Check if line only contains bracket pairs

  -- Configure specific pairs. You can customize these.
  -- Add a comma after `map_cr = true,` if you add these:
  -- pairs = {
  --   { '(', ')' },
  --   { '[', ']' },
  --   { '{', '}' },
  --   { '"', '"' },
  --   { "'", "'" },
  --   { '`', '`' },
  -- },

  -- Add rule to work with nvim-cmp
  -- This is crucial for seamless integration
  check_ts = true, -- Use treesitter for better context awareness
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = { "string", "source" },
    -- Add the new languages here for Treesitter context
    rust = { "string", "source" },
    c = { "string", "source" },
    python = { "string", "comment", "string_content" }, -- Python might benefit from 'comment' and 'string_content'
    go = { "string", "source" },
    -- You can add other filetypes you use frequently
    html = { "string", "attribute_value" },
    css = { "string" },
    json = { "string" },
  },
})

-- Integrate with nvim-cmp
-- This makes sure that when nvim-cmp is active, autopairs plays nicely.

cmp.event:on(
  'confirm_done',
  autopairs.on_confirm_done -- Corrected: No parentheses after on_confirm_done
)

-- OPTIONAL: Add a rule to automatically close comments, similar to what you might find in some IDEs.
-- This is an example for C/C++/Java style comments.

