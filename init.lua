require('plugins')
require('core')
require('config')


if vim.fn.has("win32") == 1 then
    -- Convert input to full-width characters after leaving insert mode
    vim.cmd("autocmd InsertLeave * silent !zenhan 0")
    os.execute('zenhan.exe 0')
 end