-- vim: ts=2:sw=2:expandtab


-- See also embedded keymaps:
-- - plugins/lsp.lua
-- - plugins/blink-cmp.lua
-- - plugins/nvim-scrollview.lua
-- - plugins/which-key.lua


-- Neo-tree bindings
vim.keymap.set('n', '|',
  function()
    -- Save current window before focusing neo-tree
    _G.neo_tree_previous_win = vim.api.nvim_get_current_win()
    vim.cmd('Neotree focus')
  end,
  { desc = 'Focus Neo-tree' }
)
-- vim.keymap.set('n', '<leader>b', ':Neotree toggle buffers right<cr>')
-- vim.keymap.set('n', '<leader>s', ':Neotree float git_status<cr>')


-- Aerial
-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")


-- NoNeckPain
local wk = require("which-key")
wk.add({
  {"<leader>tn", "<cmd>NoNeckPain<cr>", desc = "NoNeckPain"},
})



local opts = { noremap = true, silent = true }

-- Normal-mode commands
vim.keymap.set('n', '<C-S-down>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<C-S-up>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<C-S-left>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<C-S-right>', ':MoveHChar(1)<CR>', opts)
-- vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
-- vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<C-S-down>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<C-S-up>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-S-left>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-S-right>', ':MoveHBlock(1)<CR>', opts)
