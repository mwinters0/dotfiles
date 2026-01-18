-- vim: ts=2:sw=2:expandtab

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { -- Library of animation functions
        enabled = true
      },
      bigfile = { -- Disable LSP / treesitter on huge files
        enabled = true,
        size = 1024 * 1024 -- 1Mb
      },
      bufdelete = { -- Utility to delete buffer but keep window
        enabled = true
      },
      -- dashboard = { -- Start page
      --   enabled = true
      -- },
      -- dim = { -- Dim code outside current context
      --   enabled = true
      -- },
      -- explorer = { -- File explorer (neo-tree replacement) TODO: maybe???
      --   enabled = true
      -- },
      -- gh = { -- CLI Integration
      --   enabled = true
      -- },
      -- git = { -- TODO: maybe?
      --   enabled = true
      -- },
      -- gitbrowse = { -- Open current repo (and branch) in web browser TODO: maybe?
      --   enabled = true
      -- },
      -- image = { -- Kitty graphics
      --   enabled = true
      -- },
      indent = { -- Scope gutters
        -- FIXME: Use thinner / small vertical dots
        enabled = true,
        animate = { enabled = false },
        scope = { enabled = true }, --colorize scope?
        chunk = { -- only in innermost scope?
          enabled = true,
          only_current = true, -- only in current window
          char = {
            -- https://unicode-explorer.com/b/2500
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "╴", -- top edge
            vertical = "│",
            arrow = "╴", -- bottom edge
          },
        },
      },
      input = { -- Text input box
        enabled = true,
      },
      -- keymap = { -- Set keymaps by filetype / lsp capability
      --   enabled = true,
      -- },
      -- layout = { -- undocumented...
      --   enabled = true
      -- },
      -- lazygit = { -- CLI Integration
      --   enabled = true
      -- },
      notifier = { -- Toast
        enabled = true,
        timeout = 3000,
      },
      picker = { -- Telescope replacement
        enabled = true,
      },
      -- quickfile = { -- Disable plugins until after first paint
      --   enabled = true
      -- },
      -- rename = { -- LSP-aware utility function
      --   TODO: enable and integrate with neo-tree
      --   https://github.com/folke/snacks.nvim/blob/main/docs/rename.md#neo-treenvim
      --   enabled = true
      -- },
      -- scope = { -- TODO: ???
      --   enabled = true
      -- },
      -- scratch = { -- Scratch buffers TODO: maybe?
      --   enabled = true
      -- },
      scroll = { -- Animated scroll - good for jumps
        enabled = true,
        animate = {
          duration = { step = 10, total = 100 },
          easing = "linear",
        },
      },
      statuscolumn = { -- TODO: ???
        enabled = true
      },
      -- terminal = { -- TODO: maybe?
      --   enabled = true
      -- },
      -- toggle = { -- TODO: maybe?
      --   enabled = true
      -- },
      -- win = { -- TODO: ???
      --   enabled = true
      -- },
      words = { -- Auto-show LSP references & navigate them
        enabled = true
      },
      -- zen = { -- "Hide the GUI" mode
      --   enabled = true
      -- },
      -- styles = {
      --   notification = {
      --     -- wo = { wrap = true } -- Wrap notifications
      --   }
      -- }
    },
    keys = {
      ---- == PICKERS == ----
      -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" }, -- FIXME: Open this in normal mode
      -- { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
      -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" }, -- maybe???
      ---- FIND
      -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      ---- GIT
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- GH
      -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      -- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      -- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
      ---- GREP
      -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      ---- SEARCH
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" }, -- fuzzy search the buffer
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      -- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" }, -- searches ~/.config/nvim
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" }, -- resumes the last picker
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      ---- SEARCH: Other plugins
      -- todo-comments plugin creates these functions:
      -- https://github.com/folke/todo-comments.nvim/blob/main/lua/todo-comments/snacks.lua
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
      ---- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
      { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

      ---- == OTHER == ----
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
    init = function()
      local wk = require("which-key")
      wk.add({
        {"<leader>b", group="Buffer Actions"},
        {"<leader>f", group="Find"},
        {"<leader>g", group="Git"},
        {"<leader>s", group="Search"},
      })
    end,
    dependencies = {
      -- Load these before trying to load our keymap
      "folke/which-key.nvim",
      "folke/todo-comments.nvim",
    },
  }
}
