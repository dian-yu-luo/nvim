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
vim.api.nvim_set_keymap('i', '<C-k>', '<cmd>lua delete_to_eol_insert_mode()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ":messages<CR>",    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ":source ~/.config/nvim/lua/core/keymaps.lua<CR>",    { noremap = true, silent = true })


-- 下面的函数状态实在normal模式下的工作状态

function delete_to_eol()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local column = cursor[2]
    local currentline = vim.fn.getline('.') 
    print("光标位置：行: " .. line .. "，列 :" .. column)

    if #currentline == 0 then
        -- 介绍三种状态
        -- 空行状态
        vim.api.nvim_feedkeys('dd', 'n', true)
    elseif vim.fn.col('.') == #currentline then
        -- 在行尾部
        vim.api.nvim_feedkeys('Jxh', 'n', true)
    else
        -- 其他情况
        -- 也就是在normal模式下把自己也给删除了
        vim.api.nvim_feedkeys('ld$x', 'n', true)
    end
end



function delete_to_eol_insert_mode()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]
    local column = cursor[2]
    local currentline = vim.fn.getline('.') 
    print("光标位置：行: " .. line .. "，列 :" .. column)
    if #currentline == 0 then
        vim.api.nvim_input('<ESC>ddi')
        print(1)
    elseif #currentline == column then 
        vim.api.nvim_input('<ESC>Jxha')   
    elseif column == 0 then 
        vim.api.nvim_input('<ESC>ld$xa')  
    else
        vim.api.nvim_input('<ESC>lld$xa')  
    end         
end     