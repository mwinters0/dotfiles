-- vim: ts=2:sw=2:expandtab


------ # Options (:set foo) ------

do
  -- vim.o is for primitive options (boolean, string, etc)

  vim.o.number	    = true -- Show line numbers
  vim.o.wrap        = true -- Enable soft wrap
  vim.o.ignorecase  = true -- Searches with `/` are default case insensitive
  vim.o.smartcase   = true --   - Unless you use an uppercase character!

  vim.o.scrolloff   = 4    -- Keep context on screen
  vim.o.foldlevel   = 99   -- Open files unfolded
  vim.o.showmatch   = true -- Briefly jump cursor to matching bracket when inserting (if on screen)


  -- vim.opt is a helper for complex options (lists, maps, etc)

  vim.opt.dictionary = {
    "/usr/share/dict/words", -- dnf install words
    vim.fn.expand("~/.config/nvim/dictionary.txt"),
  }
end


------ # Variables (:let foo) ------

do
  -- Reference: vim.(g)lobal, (b)uffer, (w)indow, (t)abpage, (v)im, (env)

  -- -- Disable netrw (per nvim-tree install instructions)
  -- vim.g.loaded_netrw = 1
  -- vim.g.loaded_netrwPlugin = 1

  -- Set leader before installing plugins
  vim.g.mapleader = " " -- leader is space
  vim.g.maplocalleader = "\\"
end


------ # Load plugins -----

require("config.lazy") -- config/lazy.lua


------ # Post-plugin config ------

require("config.appearance")
require("config.keymap")
if vim.g.neovide then
  -- https://neovide.dev/configuration.html
  require("config.neovide")
end

-- use treesitter for cold folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'


