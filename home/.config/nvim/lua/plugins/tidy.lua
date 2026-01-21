-- vim: ts=2:sw=2:expandtab

return {
  {
    "mcauley-penney/tidy.nvim",
    config={
      enabled_on_save = true,
      filetype_exclude = {},
      only_modified_lines = true,
      provide_undefined_editorconfig_behavior = true, -- if you have .editorconfig but didn't define a whitespace setting
    },
  },
}
