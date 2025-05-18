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
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<tab>'] = cmp.mapping.confirm({ select = true }),
                    ["<n>"] = cmp.mapping.select_next_item(),
                    ["<m>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lsp' },
                    { name = 'luasnip' } }, { { name = 'buffer' }
                })
            })
        end
    },
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = { "clangd", "gopls", "lua_ls", "pylsp", "sqls", "jdtls" } })
        end
    },
    -- {
    --     "nvimtools/none-ls.nvim",
    --     config = function()
    --         local null_ls = require("null-ls")
    --         null_ls.setup({ sources = { null_ls.builtins.formatting.clang_format, }, })
    --     end
    -- },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.sqls.setup({ capabilities = capabilities })
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    -- vim.keymap.set('n', '', vim.lsp.buf.definition, opts, { desc = "go definition" })
                    -- vim.keymap.set('n', '', vim.lsp.buf.declaration, opts, { desc = "go declaration" })
                    -- vim.keymap.set('n', '', vim.lsp.buf.references, opts, { desc = "go references" })
                    -- vim.keymap.set('n', '', vim.lsp.buf.implementation, opts, { desc = "go implementation" })
                    -- vim.keymap.set('n', '', vim.lsp.buf.type_definition, opts, { desc = "go type definition" })
                    -- vim.keymap.set('n', '', vim.lsp.buf.hover, opts, { desc = "hover" })

                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts,
                        { desc = "add workspace folder to buffer" })
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts,
                        { desc = "remove workspace folder from buffer" })
                    vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts, { desc = "list workspace folders of buffer" })

                    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, opts,
                        { desc = "format file" })
                end
            })
        end
    },
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" }, },
        event = "LspAttach",
        config = function()
            require('tiny-code-action').setup({
                vim.keymap.set("n", "<leader>ca", function()
                    require("tiny-code-action").code_action()
                end, { noremap = true, silent = true, desc = "show code action" })
            })
        end
    },
}
