-- Autocomplete
-- https://cmp.saghen.dev/configuration/general.html

return {
  {
    "https://github.com/saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        -- Default mappings:
        -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        -- ['<C-e>'] = { 'hide', 'fallback' },
        -- ['<C-y>'] = { 'select_and_accept', 'fallback' },
        --
        -- ['<Up>'] = { 'select_prev', 'fallback' },
        -- ['<Down>'] = { 'select_next', 'fallback' },
        -- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        -- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        --
        -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        --
        -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
        -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        --
        -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        preset = 'default',
        ['<C-Enter>'] = { 'select_and_accept', 'fallback' },
      },
      -- Show function signature documentation when available
      signature = { enabled = true },
      sources = {
        -- add lazydev (in lsp.lua) to completion providers (from lazydev docs)
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
}

