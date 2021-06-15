local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable = true
    },
    highlight = {
      enable = true,
    },
    ensure_installed = 'maintained'
  }
end

return config
