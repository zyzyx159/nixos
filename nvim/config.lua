-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.spell = true
vim.opt.clipboard = "unnamedplus"

-- set leader key
vim.g.mapleader = ' '

-- set custom key mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<up>', 'gj')
map('n', '<down>', 'gk')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

