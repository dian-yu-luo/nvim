local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
    },
    completion = {
        completeopt = "menu,menuone",
    },
    experimental = {
        ghost_text = {
            hl_group = false
        },
    },
    mapping = {
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-m>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
          }),
      },
    sources = cmp.config.sources(
        {
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        {
            { name = 'buffer' },
        }
    )
})
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})
cmp.setup.cmdline({ '/', '?' }, {
    completion = {
        completeopt = "menu,menuone,noselect",
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    completion = {
        completeopt = "menu,menuone,noselect",
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
