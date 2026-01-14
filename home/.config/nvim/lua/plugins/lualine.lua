-- vim: ts=2:sw=2:expandtab

-- Status bar (bottom)

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "gruvbox",
        globalstatus = true
      },
      extensions = {'aerial', 'mason', 'neo-tree'},
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
            --shorting_path = 30,
          }
        },
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {
          --'aerial'
        },
        lualine_x = {'filetype'},
        lualine_y = {
          {
            'location',
            padding = 0,
          }
        },
        lualine_z = {
          {
            'datetime',
            style = "%H:%M"
          }
        }
      },
    }
  },
}

