require('plugins')
require('core')
require('config')

vim.cmd([[
    autocmd BufReadPost *
        if line("'\"") > 0 and line ("'\"") <= line("$") then
            exe "normal! g'\""
        end
]])

vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
