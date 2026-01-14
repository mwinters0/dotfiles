-- vim: ts=2:sw=2:expandtab

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      },
      {
        "https://github.com/neovim/nvim-lspconfig",
        -- opts = {
        --   ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "cpp", "css", "go", "json", "make", "markdown_inline", "php", "rust", "toml" },
        --   sync_install = true,
        --   auto_install = false,  -- Automatically install missing parsers when entering buffer. Requires 'tree-sitter' CLI.
        --   highlight = {
        --     enable = true,
        --     additional_vim_regex_highlighting = false,
        --   },
        -- },
      },
    }, -- lspconfig dependencies
    opts = {
      ensure_installed = {
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "gopls",
        "html",
        "lua_ls",
        "mesonlsp",
        "rust_analyzer",
        "systemd_lsp",
        "yamlls",
      }
    }, -- opts
  },
  {
    -- Configures the lua LSP to understand nvim
    "https://github.com/folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    -- Autocomplete
    -- https://cmp.saghen.dev/configuration/general.html
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
        -- add lazydev to completion providers (from lazydev docs)
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
