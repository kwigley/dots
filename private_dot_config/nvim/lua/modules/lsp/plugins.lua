local lsp = {}
local conf = require('modules.lsp.config')

lsp['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
}

lsp['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

lsp['hrsh7th/nvim-compe'] = {
  event = 'InsertEnter',
  config = conf.nvim_compe,
}

lsp['hrsh7th/vim-vsnip'] = {
  event = 'InsertCharPre',
  config = conf.vim_vsnip
}

lsp['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim', opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
    {'nvim-telescope/telescope-frecency.nvim', opt = true},
  }
}

lsp['mattn/vim-sonictemplate'] = {
  cmd = 'Template',
  ft = {'go','typescript','lua','javascript','vim','rust','markdown'},
  config = conf.vim_sonictemplate,
}

lsp['mattn/emmet-vim'] = {
  event = 'InsertEnter',
  ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
  config = conf.emmet,
}

lsp['onsails/lspkind-nvim'] = {
  config = conf.lspkind_nvim
}

lsp['folke/lsp-trouble.nvim'] = {
  cmd = 'LspTroubleToggle',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = conf.lsp_trouble
}

return lsp
