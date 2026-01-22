-- vim: ts=2:sw=2:expandtab

-- FIXME: mouse support broken??

return {
  {
    'https://github.com/dstein64/nvim-scrollview',
    opts = {
      signs_column = 0, -- put signs inside the scroll column
      signs_max_per_row = 1,
      signs_on_startup = {'search', 'diagnostics'},
      visibility = 'always',
    },
  }
}
