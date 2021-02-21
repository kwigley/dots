local utils = require('utils')
local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd [[set list listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬]]
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 10)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'cmdheight', 2)
utils.opt('o', 'showmode', false)
utils.opt('b', 'autoindent', true)
utils.opt('b', 'cindent', true)
utils.opt('w', 'wrap', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'mouse', 'a')
-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
