-- vim: ts=2:sw=2:expandtab

vim.cmd("colorscheme gruvbox")


-- Add columncolor for git commits
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.textwidth = 72
    vim.opt.colorcolumn = "+1"
  end
})


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
