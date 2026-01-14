-- vim: ts=2:sw=2:expandtab

return {
  {
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "https://github.com/nvim-mini/mini.icons",
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      -- event_handlers = {
      --   {
      --     -- trying to close buffee picker on select
      --     event = "vim_buffer_enter ", --better?
      --     --event = "neo_tree_buffer_leave", --vim_buffer_enter better?
      --     handler = function()
      --       vim.cmd("Neotree close")
      --     end
      --   },
      -- }
      enable_diagnostics = false,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    }
  }
}
