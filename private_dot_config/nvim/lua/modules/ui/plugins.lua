local ui = {}
local conf = require('modules.ui.config')

ui['arcticicestudio/nord-vim'] = {
  config = [[vim.cmd('colorscheme nord')]]
}

ui['vim-airline/vim-airline'] = {
  config = [[vim.cmd('let g:airline#extensions#tabline#enabled = 1')]]
}

ui['mhinz/vim-startify'] = {
  config = conf.startify
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf._gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
