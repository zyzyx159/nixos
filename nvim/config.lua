local opt = vim.opt
local g = vim.g

-- vim options
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.linebreak = true
opt.wrap = true
opt.spell = true
opt.clipboard = "unnamedplus" -- remember to install xclip or wl-clipboard

-- set leader key
g.mapleader = ' '

-- set custom key mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<up>', 'gk')
map('n', '<down>', 'gj')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

