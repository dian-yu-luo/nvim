if vim.fn.empty(vim.fn.glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim')) > 0 then
    vim.cmd(
        '!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')
    vim.cmd('autocmd VimEnter * PackerInstall')
end
-- 自定义配置的模块
require('plugins')
require('core')
require('config')


vim.cmd("autocmd InsertLeave * silent !zenhan 0")
os.execute('zenhan.exe 0')
