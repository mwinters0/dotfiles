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
