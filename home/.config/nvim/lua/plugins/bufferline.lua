-- vim: ts=2:sw=2:expandtab

-- Bufferline = tab page

return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "tabs",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        numbers = "ordinal",
        -- separator_style = "slope",
      }
    }
  },
}

