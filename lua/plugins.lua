vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'glepnir/dashboard-nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'gelguy/wilder.nvim'
  use 'neovim/nvim-lspconfig'
end)
