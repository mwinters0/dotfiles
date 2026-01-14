-- vim: ts=2:sw=2:expandtab


------ # Options (:set foo) ------


do
  -- vim.o is for primitive options (boolean, string, etc)
  vim.o.scrolloff   = 4    -- Keep context on screen
  vim.o.showmatch   = true -- Briefly jump cursor to matching bracket when inserting (if on screen)
  vim.o.ignorecase  = true -- Searches with `/` are default case insensitive
  vim.o.smartcase   = true --   - Unless you use an uppercase character!
  vim.o.number	    = true -- Show line numbers
  vim.o.wrap        = true -- Enable soft wrap

  -- vim.opt is a helper for complex options (lists, maps, etc)

  vim.opt.dictionary = {
    "/usr/share/dict/words", -- dnf install words
    vim.fn.expand("~/.config/nvim/dictionary.txt"),
  }
end


------ # Variables (:let foo) ------


do
  -- Reference: vim.(g)lobal, (b)uffer, (w)indow, (t)abpage, (v)im, (env)

  -- Disable netrw (per nvim-tree install instructions)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- Set leader before installing plugins so mappings are correct
  vim.g.mapleader = " " -- leader is space
  vim.g.maplocalleader = "\\"
end


------ # Load plugins -----


require("config.lazy") -- config/lazy.lua


------ # Post-plugin config ------


vim.cmd("colorscheme gruvbox")

vim.diagnostic.config({
  -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts
  -- virtual_text = true,      -- show inline messages at line ending
  virtual_lines = {         -- show messages on virtual line
    current_line = true,    -- cursor line only
  },
  signs = true,             -- show signs in the gutter
  underline = true,         -- underline problematic text
  update_in_insert = false, -- don't update diagnostics while typing
  severity_sort = true,     -- sort diagnostics by severity
})

-- use treesitter for cold folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Add columncolor for git commits
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.textwidth = 72
    vim.opt.colorcolumn = "+1"
  end
})


-- Neo-tree bindings
vim.keymap.set('n', '|', ':Neotree focus toggle<cr>', {desc='Neotree Toggle'})
-- vim.keymap.set('n', '<leader>/', ':Neotree toggle current reveal_force_cwd<cr>')
--vim.keymap.set('n', 'gd', ':Neotree float reveal_file=<cfile> reveal_force_cwd<cr>')
vim.keymap.set('n', '<leader>b', ':Neotree toggle buffers right<cr>')
vim.keymap.set('n', '<leader>s', ':Neotree float git_status<cr>')
