local ui = {}
local conf = require('modules.ui.config')

ui['folke/tokyonight.nvim'] = {
  config = function()
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
    vim.cmd [[colorscheme tokyonight]]
  end
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.nvim_lualine,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['akinsho/nvim-bufferline.lua'] = {
  cmd = {
    'BufferLinePick',
    'BufferLineCycleNext',
    'BufferLineCyclePrev',
    'BufferLineSortByDirectory',
    'BufferLineSortByExtension'
  },
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.nvim_gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui
