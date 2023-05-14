require('plugins')
require('core')
require('config')


vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
