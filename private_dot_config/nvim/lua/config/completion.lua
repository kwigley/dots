local utils = require'utils'

utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = "<cr>"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1

-- <Tab> to navigate the completion menu
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

vim.cmd [[imap <Tab> <Plug>(completion_smart_tab)]]
vim.cmd [[imap <S-Tab> <Plug>(completion_smart_s_tab)]]
