return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'arcticicestudio/nord-vim' }

  -- Fuzzy finder
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-telescope/telescope.nvim' }

  use {'junegunn/fzf', run = '-> fzf#install()' }
  use {'junegunn/fzf.vim'}

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }
  use { 'ojroques/nvim-lspfuzzy' }
  use { 'alexaandru/nvim-lspupdate' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/completion-treesitter' }
  use { 'rust-lang/rust.vim' }
  -- use { 'tjdevries/nlua.nvim' }

  -- git
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  --use { 'airblade/vim-gitgutter' }
  use { 'vim-airline/vim-airline' }

  use { 'ntpeters/vim-better-whitespace' }
  use { 'plasticboy/vim-markdown' }

  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'christoomey/vim-tmux-navigator' }
  -- use { 'preservim/nerdcommenter' }
  use { 'tpope/vim-commentary' }
  use { 'jiangmiao/auto-pairs' }
  use { 'Yggdroot/indentLine' }
end)
