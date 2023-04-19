-- 安装Packer插件管理器（如果没有安装）
if vim.fn.empty(vim.fn.glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim')) > 0 then
    vim.cmd(
        '!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')
    vim.cmd('autocmd VimEnter * PackerInstall')
end

require('plugins')
require('core')

vim.o.guifont = '霞鹜文楷等宽:h16'
vim.o.clipboard = 'unnamed'

require('dashboard').setup()
vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })

-- local wilder = require('wilder')
-- wilder.setup({modes = {':', '/', '?'}})

local telescope = require('telescope')
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', "<cmd>lua require('telescope.builtin').commands()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').command_history()<CR>",
    { noremap = true, silent = true })

require("which-key").setup {}

require('orgmode').setup_ts_grammar()
require 'nvim-treesitter.configs'.setup {
    -- If TS highlights are not enabled at all, or disabled via ``disable`` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        disable = { 'org' },                           -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = { 'org' },                      -- Or run :TSUpdate org
}

require('orgmode').setup({
    org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
    org_default_notes_file = '~/Dropbox/org/refile.org',
})

require('lualine').setup(
    {
        options = { theme = 'gruvbox' }
    }
)

vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
