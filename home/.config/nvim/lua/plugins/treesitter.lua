-- vim: ts=2:sw=2:expandtab

-- Supported languages: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/4767

-- Note: also a dependency of Aerial

return {
  {
    'https://github.com/nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },
  {
    -- Restores the functionality from the treesitter 'master' branch,
    -- such as ensure_installed
    'https://github.com/MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      ensure_installed = {
        'bash',
        'bibtex',
        'c',
        'cmake',
        -- 'comment',
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
      },
      fold = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    },
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
  -- TODO: https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
}

