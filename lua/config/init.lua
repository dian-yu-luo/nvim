require("config.cmp")
require("config.dashboard")
require("config.treesitter")
require("config.telescope")
require("config.lualine")
require("config.lsp")
require("config.nvimtree")
-- 一行就能解决的配置
require("which-key").setup {}
require('neogit').setup {}
require("formatter").setup {}
require('Comment').setup()
require("nvim-tree").setup {}
require("nvim-autopairs").setup {}
require("mason").setup {}
require("toggleterm").setup()

