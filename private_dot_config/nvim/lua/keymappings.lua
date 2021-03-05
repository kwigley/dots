local utils = require('utils')

utils.map('i', 'jk', '<Esc>')
utils.map('n', '<leader>c', '<cmd>nohl<cr>')
utils.map('n', '<C-n>', '<cmd>bnext<cr>')
utils.map('n', '<C-p>', '<cmd>bprev<cr>')
utils.map('n', '<leader>q', '<cmd>%bd|e#|bd#<cr>')
