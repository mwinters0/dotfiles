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
    }, -- end dependencies
    opts = {
      ensure_installed = {
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        "basedpyright",
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
}
