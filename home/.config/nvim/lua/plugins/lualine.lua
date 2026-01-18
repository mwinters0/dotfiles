-- vim: ts=2:sw=2:expandtab

-- Status bar (bottom)

return {
  {
    'https://github.com/nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "gruvbox",
        globalstatus = true,
        component_separators = { left = '', right = '' }
      },
      extensions = {
        'aerial',
        'lazy',
        'mason',
        'neo-tree',
        'trouble'
      },
      sections = {
        lualine_a = {
          {
            function()
             return  "t" .. vim.api.nvim_get_current_tabpage() ..
              ":b" .. vim.api.nvim_get_current_buf()
            end,
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            'filename',
            path = 1, -- magic number = "relative path"
            --shorting_path = 30, -- limit length, default: 40
            symbols = {
              modified = '[M]',
              readonly = '[RO]',
            },
          }
        },
        lualine_b = {
          'diagnostics'
        },
        lualine_c = {
          --'aerial'
        },
        lualine_x = {
          {
            'diff',
            -- Get diff data from gitsigns
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed
                }
              end
            end
          },
          {
            -- Get git branch from gitsigns, and color the icon by
            -- whether we have any uncommitted changes.
            'b:gitsigns_head',
            cond = function()
              if vim.b.gitsigns_status_dict then return true end
              return false
            end,
            icon = {
              '',
              color = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns and
                  gitsigns.added and gitsigns.changed and gitsigns.removed and
                  gitsigns.added + gitsigns.changed + gitsigns.removed == 0 then
                  return {fg='#b8bb26'} -- gruvbox_dark green
                end
                return {fg='#fe8019'} -- gruvbox_dark yellow
              end,
            },
          },
        },
        lualine_y = {
          'filetype',
          'lsp_status'
        },
        lualine_z = {
          {
            'location',
            padding = {
              left = 0,
              right = 1,
            },
          },
          'searchcount',
          'selectioncount'
        },
      },
    }
  },
}

