local utils = require('utils')

utils.nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
utils.nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
utils.nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
utils.nnoremap('<leader>fa', '<cmd>Telescope grep_string<cr>')
utils.nnoremap('<leader>fs', '<cmd>Telescope lsp_workspace_symbols<cr>')
