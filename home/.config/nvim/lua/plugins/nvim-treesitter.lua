-- vim: ts=2:sw=2:expandtab

-- Supported languages: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
--
-- This targets the `main` branch of nvim-treesitter (the Nvim 0.12 rewrite).
-- On `main` the plugin only *installs parsers and queries*; enabling features
-- (highlight/fold/indent) is done through Neovim's own API, which is what the
-- FileType autocommand below does.
--
-- Requires `tree-sitter-cli`, a C compiler, `tar` and `curl` on PATH.
--
-- Note: also a dependency of Aerial.

-- Parsers to keep installed. Neovim itself ships c, lua, markdown,
-- markdown_inline, query, vim and vimdoc, so those need not be listed.
local ensure_installed = {
  'bash',
  'bibtex',
  'c',
  'cmake',
  -- 'comment', -- handled by todo-comments
  'cpp',
  'css',
  'csv',
  'dart',
  'desktop',
  'diff',
  'dockerfile',
  'dot',
  'go',
  'gomod',
  'gosum',
  'gotmpl',
  'helm',
  'html',
  'ini',
  'java',
  'javascript',
  'jq',
  'json',
  'json5',
  'jsonnet',
  'just',
  'kconfig',
  'kdl',
  'kitty',
  'latex',
  'lua',
  'make',
  'meson',
  'nginx',
  'ninja',
  'nix',
  'python',
  'rust',
  'scss',
  'sql',
  'ssh_config',
  'tcl',
  'terraform',
  'toml',
  'tsx',
  'typescript',
  'typst',
  'vim',
  'vimdoc',
  'vue',
  'xml',
  'yaml',
  'zsh',
}

return {
  {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    lazy = false, -- the plugin does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      -- No-op for parsers that are already present.
      require('nvim-treesitter').install(ensure_installed)

      -- Turn on treesitter features for any buffer whose language has a
      -- parser available. Doing it by parser availability rather than by
      -- filetype list means this keeps working on a machine where only some
      -- of the parsers above have been built yet.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('user_treesitter', {}),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang or not pcall(vim.treesitter.start, ev.buf, lang) then
            return
          end

          -- Folding (init.lua sets foldlevel=99, so files still open unfolded)
          vim.wo[0][0].foldmethod = 'expr'
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'

          -- Indentation (still marked experimental upstream)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    -- When inside a long function, this will float the function
    -- definition at the top of the screen
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true,
      -- multiwindow = false,
      -- max_lines = 0,
      -- min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      -- line_numbers = true,
      -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
      -- trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      -- mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- -- Separator between context and content. Should be a single character string, like '-'.
      -- -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      -- separator = nil,
      -- zindex = 20, -- The Z-index of the context window
      -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
  },
  -- Incremental selection is built into Nvim 0.12: see :h v_an / v_in / v_]n / v_[n
  -- TODO: https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
}
