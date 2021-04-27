local editor = {}
local conf = require('modules.editor.config')

editor['Raimondi/delimitMate'] = {
  event = 'InsertEnter',
  config = conf.delimimate,
}

editor['rhysd/accelerated-jk'] = {
  opt = true
}

editor['knubie/vim-kitty-navigator'] = {}

editor['norcalli/nvim-colorizer.lua'] = {
  ft = { 'html','css','sass','vim','typescript','typescriptreact'},
  config = conf.nvim_colorizer
}

editor['itchyny/vim-cursorword'] = {
  event = {'BufReadPre','BufNewFile'},
  config = conf.vim_cursorword
}

editor['hrsh7th/vim-eft'] = {
  opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end
}

editor['kana/vim-operator-replace'] = {
  keys = {{'x','p'}},
  config = function()
    vim.api.nvim_set_keymap("x", "p", "<Plug>(operator-replace)",{silent =true})
  end,
  requires = 'kana/vim-operator-user'
}

editor['rhysd/vim-operator-surround'] = {
  event = 'BufRead',
  requires = 'kana/vim-operator-user'
}

editor['kana/vim-niceblock']  = {
  opt = true
}

editor['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp' }
}

editor['Osse/vim-cd'] = {
  cmd = {'Cd'}
}

editor['Asheq/close-buffers.vim'] = {
  cmd = {'Bdelete'}
}

editor['ntpeters/vim-better-whitespace'] = {
  config = function()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 1
  end
}

return editor