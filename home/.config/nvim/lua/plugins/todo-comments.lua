-- vim: ts=2:sw=2:expandtab

-- Highlight todos

return {
  {
    "https://github.com/folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false, -- create signs
    },
  }
}

