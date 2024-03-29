local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require("packer").startup(function(use)
    use "dstein64/vim-startuptime"
    use "ahmedkhalf/project.nvim"
    use "akinsho/toggleterm.nvim"
    use "wbthomason/packer.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "glepnir/dashboard-nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "folke/which-key.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "nvim-lualine/lualine.nvim"
    use "TimUntersberger/neogit"
    use "sindrets/diffview.nvim"
    use "mhartington/formatter.nvim"
    use "numToStr/Comment.nvim"
    use "nvim-tree/nvim-tree.lua"
    use "windwp/nvim-autopairs"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use "williamboman/mason.nvim"
    use "rafamadriz/friendly-snippets"
    use "L3MON4D3/LuaSnip"
    use "williamboman/mason-lspconfig.nvim"
    use 'saadparwaiz1/cmp_luasnip'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
