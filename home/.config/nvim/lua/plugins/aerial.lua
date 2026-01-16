-- Aerial provides a code outline window

return {{
  'https://github.com/stevearc/aerial.nvim',
  opts = {
    layout = {
      default_direction = "float",
      max_width = { 70, 0.8 },
      --width = 0.8,
    },
    filter_kind = false, -- show every type of navigable entity (Class, Enum, etc)
    close_on_select = true,
    show_guides = true,  -- show box drawing characters for hierarchy
  },
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
}}
