-- vim: ts=2:sw=2:expandtab

do
  vim.cmd("colorscheme gruvbox")
  -- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox.lua
  local gb = require("gruvbox")

  -- BASH
  -- vim.api.nvim_set_hl(0, 'shConditional', { link = 'Normal' })
  -- vim.api.nvim_set_hl(0, 'shLoop', { link = 'Normal' })
  -- -- for makethisblue in
  -- vim.api.nvim_set_hl(0, 'shFor', { link = 'GruvboxBlue' })
  -- vim.api.nvim_set_hl(0, 'shOption', { link = 'GruvboxPurple' })
  -- vim.api.nvim_set_hl(0, 'shStatement', { link = 'Normal' })
  -- vim.api.nvim_set_hl(0, 'shCommandSub', { link = 'Normal' })
  -- vim.api.nvim_set_hl(0, 'shDoubleQuote', { link = 'Normal' })
  -- vim.api.nvim_set_hl(0, 'shSingleQuote', { link = 'Normal' })
  -- -- shVariable is blue but DerefSimple and DerefVar are aqua ...
  -- vim.api.nvim_set_hl(0, 'shDerefSimple', { link = 'GruvboxBlue' })
  -- vim.api.nvim_set_hl(0, 'shDerefVar', { link = 'GruvboxBlue' })

  -- TABPAGE
  vim.api.nvim_set_hl(0, 'TabLineFill', -- background
    {
      fg=gb.palette.dark3,
      bg=gb.palette.dark0_hard,
    }
  )
  vim.api.nvim_set_hl(0, 'TabLineSel', -- selected tab
    {
      fg=gb.palette.bright_green,
      bg=gb.palette.dark1,
    }
  )
  vim.api.nvim_set_hl(0, 'TabLine', -- other tabs
    {
      fg=gb.palette.light4,
      bg=gb.palette.dark1,
    }
  )
  vim.api.nvim_set_hl(0, 'ScrollView', -- https://github.com/dstein64/nvim-scrollview/blob/316c37c96e6ab7d15e18f878366d0497179e8891/plugin/scrollview.vim#L25
    {
      fg=gb.palette.bright_orange, -- not used
      bg=gb.palette.dark0_soft,
    }
  )
  vim.api.nvim_set_hl(0, 'InclineNormal', -- focused window
    {
      fg=gb.palette.light2 ,
      bg=gb.palette.dark0,
    }
  )
  vim.api.nvim_set_hl(0, 'InclineNormalNC', -- other windows
    {
      fg=gb.palette.dark4,
      bg=gb.palette.dark0,
    }
  )
end

-- Always show tabline
-- vim.o.showtabline = 2

-- Git commits: columncolor
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt.textwidth = 72
    vim.opt.colorcolumn = "+1"
  end
})


-- Diagnostics
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

-- nvim 0.12!
-- This is from https://github.com/mikesmithgh/borderline.nvim/blob/main/lua/borderline/borders.lua
-- vim.o.winborder = '🭽,▔,🭾,▕,🭿,▁,🭼,▏'
