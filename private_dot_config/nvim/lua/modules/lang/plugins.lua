local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

lang['JoosepAlviste/nvim-ts-context-commentstring'] = {
  after = 'nvim-treesitter'
}

lang['windwp/nvim-ts-autotag'] = {
  after = 'nvim-treesitter'
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

lang['steelsojka/headwind.nvim'] = {
  after = 'nvim-treesitter',
  config = function()
    require("headwind").setup{}
  end
}

return lang
