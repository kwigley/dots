local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '<C-n>', ':bnext<CR>')
utils.map('n', '<C-p>', ':bprev<CR>')
