require 'lspconfig'.pyright.setup {}
require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- library = vim.api.nvim_get_runtime_file("", true),
                library= "~/.config/nvim"
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
