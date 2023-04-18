require('plugins')

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>ddk', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Delete>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-/>', '<C-u>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-y>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-A>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-F>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-B>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Esc>b', '<S-Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Esc>f', '<S-Right>', { noremap = true })
vim.api.nvim_set_keymap('c', "<C-y>", '\"+p', { noremap = true, silent = true })
function delete_to_eol()
    local line = vim.fn.getline('.')
    if #line == 0 or vim.fn.col('.') == #line + 1 then
        vim.api.nvim_del_current_line()
    else
        vim.api.nvim_feedkeys('d$', 'n', true)
    end
end

vim.api.nvim_set_keymap('n', '<C-k>', ':lua delete_to_eol()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', ':lua delete_to_eol()<CR>', { noremap = true, silent = true })

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

vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
