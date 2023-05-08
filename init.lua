if vim.fn.empty(vim.fn.glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim')) > 0 then
    vim.cmd(
        '!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')
    vim.cmd('autocmd VimEnter * PackerInstall')
end
-- 自定义配置的模块
require('plugins')
require('core')
--[[ 前置的插件配置效果 ]]
require('dashboard').setup()
vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = { "c", "rust" },
        disable = function(lang, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
}

local telescope = require('telescope')
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', "<cmd>lua require('telescope.builtin').commands()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').command_history()<CR>",
    { noremap = true, silent = true })

require("which-key").setup {}
require('lualine').setup(
    {
        options = { theme = 'gruvbox' }
    }
)
require('neogit').setup {}
require("formatter").setup {}
require('Comment').setup()
require("nvim-tree").setup {}
require("nvim-autopairs").setup {}

vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
