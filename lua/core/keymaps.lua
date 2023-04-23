vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-n>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Up>', { noremap = true })
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
vim.api.nvim_set_keymap('n', '<C-k>', ':lua delete_to_eol()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:lua delete_to_eol()<CR>', { noremap = true, silent = true })

function delete_to_eol()
    local line = vim.fn.getline('.')
    if #line == 0 or vim.fn.col('.') == #line + 1 then
        vim.api.nvim_del_current_line()
    else
        vim.api.nvim_feedkeys('d$', 'n', true)
    end
end