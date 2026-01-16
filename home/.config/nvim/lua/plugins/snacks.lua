-- vim: ts=2:sw=2:expandtab

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- animate = { enabled = true },
      -- bigfile = { enabled = true },
      -- bufdelete = { enabled = true },
      -- dashboard = { enabled = true },
      -- dim = { enabled = true },
      -- explorer = { enabled = true },
      -- gh = { enabled = true },
      -- git = { enabled = true },
      -- gitbrowse = { enabled = true },
      -- image = { enabled = true },
      indent = { -- scope gutters
        enabled = true,
        animate = { enabled = false },
        -- Don't colorize the cursor's scope
        scope = { enabled = false },
      },
      input = { -- text input ui
        enabled = true
      },
      -- keymap = { enabled = true },
      -- layout = { enabled = true },
      -- lazygit = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      -- picker = { enabled = true },
      -- quickfile = { enabled = true },
      -- rename = { enabled = true },
      -- scope = { enabled = true },
      -- scratch = { enabled = true },
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 10, total = 100 },
          easing = "linear",
        },
      },
      statuscolumn = { enabled = true },
      -- terminal = { enabled = true },
      -- toggle = { enabled = true },
      -- win = { enabled = true },
      -- words = { enabled = true },
      -- zen = { enabled = true },
      -- styles = {
      --   notification = {
      --     -- wo = { wrap = true } -- Wrap notifications
      --   }
      -- }
    },
  }
}
