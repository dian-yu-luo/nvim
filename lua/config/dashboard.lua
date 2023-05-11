require('dashboard').setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            { desc = '󰚰 Update', group = '@property', action = 'PackerSync', key = 'UU' },
            -- {
            --     icon = ' ',
            --     icon_hl = '@variable',
            --     desc = 'Files',
            --     group = 'Label',
            --     action = 'Telescope find_files',
            --     key = 'f',
            -- },
            -- {
            --     desc = ' Apps',
            --     group = 'DiagnosticHint',
            --     action = 'Telescope app',
            --     key = 'a',
            -- },
            -- {
            --     desc = ' dotfiles',
            --     group = 'Number',
            --     action = 'Telescope dotfiles',
            --     key = 'd',
            -- },
        },
    },
})
vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })
