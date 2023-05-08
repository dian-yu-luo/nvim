require('dashboard').setup()
vim.api.nvim_set_keymap('n', '<leader>d', ':Dashboard<CR>', { noremap = true, silent = true })
