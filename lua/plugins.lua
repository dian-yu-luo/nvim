vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'glepnir/dashboard-nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use "folke/which-key.nvim"
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-orgmode/orgmode'
  use 'gelguy/wilder.nvim'
  use 'neovim/nvim-lspconfig'
end)
