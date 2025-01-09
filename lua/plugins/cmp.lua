return {
    {"L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip", 'rafamadriz/friendly-snippets' }},
    { "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end,},
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-z>"] = cmp.mapping.close(),
                    ['<tab>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-m>"] = cmp.mapping.select_next_item(),
                    ["<C-,>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lsp' },
                    { name = 'luasnip' } }, { { name = 'buffer' }
                })
            })
        end
    }
}
