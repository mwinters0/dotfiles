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
      explorer = { -- File explorer (neo-tree replacement) -- TODO: decide
        enabled = true
      },
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
        enabled = true,
        animate = { enabled = false },
        scope = { enabled = true }, --colorize scope?
        chunk = { -- only in innermost scope?
          enabled = true,
          only_current = true, -- only in current window
          char = {
            -- https://unicode-explorer.com/b/2500
            horizontal = "╴", -- top edge
            -- horizontal = "‥", -- top edge
            -- horizontal = " ", -- top edge - space
            -- horizontal = "‧", -- top edge - 2027
            -- horizontal = "․", -- bottom edge - 2024
            corner_top = "╭",
            -- corner_top = "┌",
            -- corner_top = "⁚",
            -- corner_top = ".",
            -- vertical = "╎",
            vertical = "⁚", -- https://unicode-explorer.com/c/205A
            corner_bottom = "╰",
            -- corner_bottom = "└",
            -- corner_bottom = "⁚",
            -- corner_bottom = ".",
            arrow = "╴", -- bottom edge
            -- arrow = " ", -- bottom edge - space
            -- arrow = "‧", -- bottom edge - 2027
            -- arrow = "․", -- bottom edge - 2024
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
        main = {current = true}
      },
      -- quickfile = { -- Disable plugins until after first paint
      --   enabled = true
      -- },
      rename = { -- LSP-aware utility function
        -- https://github.com/folke/snacks.nvim/blob/main/docs/rename.md#neo-treenvim
        enabled = true
      },
      -- scope = { -- TODO: I think this is auto-enabled by `indent`?
      --   enabled = true
      -- },
      scratch = { -- Scratch buffers
        enabled = true
      },
      scroll = { -- Animated scroll - good for jumps
        enabled = true,
        animate = {
          duration = { step = 10, total = 100 },
          easing = "linear",
        },
      },
      statuscolumn = {
        enabled = true
      },
      terminal = { -- Library to create and manage terminal windows
        enabled = true
      },
      -- toggle = { -- TODO: maybe?
      --   enabled = true
      -- },
      win = { -- Library to create and style windows
        -- See also: https://github.com/folke/edgy.nvim
        enabled = true
      },
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
    init = function()
      -- Which-key often auto-identifies weird icons for key mappings.  This seems to
      -- be the only way to declare a mapping with icons.
      --
      -- You can't declare an icon via keys{} because that gets passed basically straight to
      -- nvim_set_keymap(), which complains that 'icon' is unknown.
      -- See: https://neovim.io/doc/user/api.html#nvim_set_keymap() or :h nvim_set_keymap
      --
      -- Note that Lazy uses keys{} to decide when to lazy-load a plugin, so you can't use
      -- this approach with lazy-loaded plugins.  Fortunately, snacks does not want to be lazy-loaded.
      -- TODO: Would this be handled better with `specs` in which-key?
      local wk = require("which-key")
      wk.add({
        -- Vaguely:
        -- Azure = files
        -- Purple = LSP / something automatic
        -- Green = misc search
        -- Orange = misc actions
        -- Cyan = help

        -- FIXME: Many pickers such as help() target the first window instead of current

        -- GROUPS --
        {"<leader>b", group="Buffer Actions"},
        {"<leader>g", group="Git"},
        {"<leader>h", group="History", icon={icon='', hl='MiniIconsGreen'}},
        {"<leader>l", group="LSP", icon={icon='', hl='MiniIconsPurple'}},
        {"<leader>lc", group="Calls", icon={icon='󰊕', hl='MiniIconsPurple'}},
        {"<leader>s", group="Search"},
        {"<leader>t", group="Toggle"},

        -- TOP-LEVEL MISC ---
        { "<leader>,", function() Snacks.picker.buffers({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Pick: Buffers", icon={icon='', hl='MiniIconsAzure'} },
        { "<leader>.", function() Snacks.picker.resume() end, desc = "Pick Again", icon={icon='', hl='MiniIconsPurple'} }, -- meta picker: resumes the last picker
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer", icon={icon='', hl='MiniIconsAzure'} },
        { "]]",        function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[",        function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

        ---- BUFFER ACTIONS
        -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete (Unload)", icon={icon='', hl='MiniIconsRed'} },
        { "<leader>bD", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>br", function() Snacks.rename.rename_file() end, desc = "Rename File", icon={icon='󰑕', hl='MiniIconsAzure'} },

        ---- GIT
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Branches" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff (Hunks)" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Log" },
        { "<leader>gLL", function() Snacks.picker.git_log_line() end, desc = "Log Line" },
        { "<leader>gLF", function() Snacks.picker.git_log_file() end, desc = "Log File" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Stash" },

        -- GH
        -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
        -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
        -- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
        -- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

        ---- SEARCH
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers", icon={icon='󰫧', hl='MiniIconsGreen'} },
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Text", icon={icon='', hl='MiniIconsAzure'} },
        { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands", icon={icon='', hl='MiniIconsOrange'} },
        { "<leader>sC", function() Snacks.picker.autocmds() end, desc = "Autocmds", icon={icon='', hl='MiniIconsOrange'} },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files", icon={icon='󰈞', hl='MiniIconsAzure'} },
        { "<leader>sF", function() Snacks.picker.git_files() end, desc = "Find Git Files", icon={icon='󰈞', hl='MiniIconsAzure'} }, -- avoids looking in build dirs
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (CWD)", icon={icon='󰛄', hl='MiniIconsAzure'} },
        { "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", icon={icon='󰛄', hl='MiniIconsAzure'} },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", icon={icon='󰋖', hl='MiniIconsCyan'} },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights", icon={icon='󰿟', hl='MiniIconsGreen'} },
        -- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps", icon={icon='󰞁', hl='MiniIconsOrange'} },
        -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks", icon={icon='󰞁', hl='MiniIconsOrange'} },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", icon={icon='󰋖', hl='MiniIconsCyan'} },
        -- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" }, -- searches ~/.config/nvim
        { "<leader>ss", function() Snacks.picker.smart() end, desc = "Smart Find Files ", icon={icon='󰈞', hl='MiniIconsAzure'} }, -- uses frecency
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- todo-comments plugin creates this function:
        -- https://github.com/folke/todo-comments.nvim/blob/main/lua/todo-comments/snacks.lua
        { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo", icon={icon='', hl='MiniIconsRed'} },

        ---- LSP
        { "<leader>lci", function() Snacks.picker.lsp_incoming_calls() end, desc = "Calls Incoming", icon={icon='⬅️', hl='MiniIconsPurple'} },
        { "<leader>lco", function() Snacks.picker.lsp_outgoing_calls() end, desc = "Calls Outgoing", icon={icon='➡️', hl='MiniIconsPurple'} },
        { "<leader>ld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", icon={icon='󰅩', hl='MiniIconsPurple'} },
        { "<leader>lD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", icon={icon='󰅩', hl='MiniIconsPurple'} },
        { "<leader>lI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", icon={icon='󰇘', hl='MiniIconsPurple'} },
        { "<leader>lr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>lt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition", icon={icon='󰅩', hl='MiniIconsPurple'} },

        --- HISTORY ---
        { '<leader>h/', function() Snacks.picker.search_history({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Searches", icon={icon='', hl='MiniIconsGreen'} },
        { "<leader>h:", function() Snacks.picker.command_history({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Commands", icon={icon='', hl='MiniIconsOrange'} },
        { "<leader>hf", function() Snacks.picker.recent({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Files", icon={icon='', hl='MiniIconsAzure'} },
        { "<leader>hn", function() Snacks.picker.notifications({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Notifications", icon={icon='', hl='MiniIconsPurple'} },
        { "<leader>hp", function() Snacks.picker.projects({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Projects", icon={icon='', hl='MiniIconsAzure'} },
        { "<leader>hu", function() Snacks.picker.undo({on_show=function() vim.cmd.stopinsert() end}) end, desc = "Undos", icon={icon='󰕌', hl='MiniIconsOrange'} },

        --- TOGGLE ---
        { "<leader>ts", function() Snacks.scratch() end, desc = "Scratch Buffer", icon={icon='', hl='MiniIconsYellow'} },
        { "<leader>tS", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", icon={icon='', hl='MiniIconsAzure'} },
        {"<leader>t/", function() Snacks.terminal() end, desc = "Toggle Terminal", icon={icon='', hl='MiniIconsOrange'}},
      })
    end, -- init
    dependencies = {
      -- Load these first
      "folke/which-key.nvim",
      "folke/todo-comments.nvim", -- We map keys here -- probably shouldn't, then wouldn't care about plugin order ...
      "https://github.com/nvim-neo-tree/neo-tree.nvim",
    }, -- dependencies
  }, -- snacks
  {
    -- Adds event handlers to trigger Snacks.rename.on_rename_file() when renamed in neo-tree
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      local events = require("neo-tree.events")
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
    end,
  }
}
