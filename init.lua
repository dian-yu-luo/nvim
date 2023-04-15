require('plugins')

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true

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
    if vim.fn.col('.') == #(vim.fn.getline('.')) then
        vim.api.nvim_del_current_line()
    else
        vim.api.nvim_feedkeys('d$', 'n', true)
    end
end

vim.api.nvim_set_keymap('n', '<C-k>', ':lua delete_to_eol()<CR>', { noremap = true, silent = true })

vim.o.guifont = '霞鹜文楷等宽:h16'
vim.o.clipboard = 'unnamed'

require('dashboard').setup()

require('wilder').setup({ modes = { ':', '/', '?' } })

vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
