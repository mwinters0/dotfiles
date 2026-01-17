-- vim: ts=2:sw=2:expandtab

-- All options: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua

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
      default_component_configs = {
        container = {
          right_padding = 1, -- make room for scrollbar
        },
      },
      enable_diagnostics = false,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,     -- show dotfiles
          force_visible_in_empty_folder = true, -- show dotfiles even in empty folders
          hide_gitignored = false,   -- show files hidden by git
          hide_ignored = false,      -- show files hidden by other tools
          show_hidden_count = false, -- don't count hidden files
        },
      },
      enable_cursor_hijack = true, -- keep cursor on first letter of file
      commands = {
        open_keepfocus = function(state)
          local neo_tree_win = vim.api.nvim_get_current_win()
          local node = state.tree:get_node()
          if node.type == "file" then
            state.commands["open"](state)
            vim.api.nvim_set_current_win(neo_tree_win)
          end
        end,
        open_tabnew_keepfocus = function(state)
          local neo_tree_win = vim.api.nvim_get_current_win()
          local node = state.tree:get_node()
          if node.type == "file" then
            state.commands["open_tabnew"](state)
            vim.api.nvim_set_current_win(neo_tree_win)
          end
        end,
        open_split_keepfocus = function(state)
          local neo_tree_win = vim.api.nvim_get_current_win()
          local node = state.tree:get_node()
          if node.type == "file" then
            state.commands["open_split"](state)
            vim.api.nvim_set_current_win(neo_tree_win)
          end
        end,
        open_vsplit_keepfocus = function(state)
          local neo_tree_win = vim.api.nvim_get_current_win()
          local node = state.tree:get_node()
          if node.type == "file" then
            state.commands["open_vsplit"](state)
            vim.api.nvim_set_current_win(neo_tree_win)
          end
        end,
        return_focus = function()
          -- Toggle back to the previous window
          if _G.neo_tree_previous_win and vim.api.nvim_win_is_valid(_G.neo_tree_previous_win) then
            vim.api.nvim_set_current_win(_G.neo_tree_previous_win)
            _G.neo_tree_previous_win = nil
          end
        end,
      }, -- commands
      window = {
        -- width = 40,
        mappings = {
          ["<C-CR>"] = "open_keepfocus",
          ["<C-t>"] = "open_tabnew_keepfocus",
          ["<C-s>"] = "open_split_keepfocus",
          ["<C-v>"] = "open_vsplit_keepfocus",
          -- We can't do Ctrl-Shift mappings reliably, so we move some
          -- defaults to keep things consistent between "normal" and
          -- their "keepfocus" versions:
          -- DEFAULT         -> NEW
          -- S (open_split)  -> s
          -- s (open_vsplit) -> v
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
          ["S"] = nil,
          ["|"] = "return_focus",
        }, -- mappings
      }, -- window
    }, -- opts
  }
}
