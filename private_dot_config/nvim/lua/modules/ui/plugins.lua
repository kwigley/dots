local ui = {}
local conf = require('modules.ui.config')

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['folke/tokyonight.nvim'] = {
  config = function()
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
    vim.cmd [[colorscheme tokyonight]]
  end
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.nvim_lualine,
  requires = {
    {'kyazdani42/nvim-web-devicons'},
    {'arkav/lualine-lsp-progress'}
  }
}

ui['kyazdani42/nvim-tree.lua'] = {
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.nvim_gitsigns,
  requires = {'nvim-lua/plenary.nvim', opt=true}
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  branch = 'lua',
  config = function()
    vim.g.indent_blankline_buftype_exclude = {'terminal'}
    vim.g.indent_blankline_filetype_exclude = {'packer', 'txt', 'markdown', 'help'}
    vim.g.indent_blankline_show_first_indent_level = false
  end
}

return ui
