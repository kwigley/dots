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

editor['tpope/vim-commentary'] = {}

editor['tpope/vim-fugitive'] = {
  cmd = {'Git', 'GBrowse'},
  requires = {
    {'tpope/vim-rhubarb', opt=true},
    {'tyru/open-browser.vim', opt=false}
  }
}

editor['Lilja/vim-chezmoi'] = {
  config = function()
    vim.g.chezmoi = "enabled"
  end
}

editor['famiu/nvim-reload'] = {
  config = function()
    local reload = require('nvim-reload')
    local config_dir = require('core.global').vim_path
    local plugin_dirs = require('core.global').data_dir .. '/site/pack/*/start/*'

    reload.vim_reload_dirs = {
        config_dir,
        plugin_dirs
    }

    reload.lua_reload_dirs = {
        config_dir,
        -- Note: the line below may cause issues reloading your config
        plugin_dirs
    }
  end
}

return editor
