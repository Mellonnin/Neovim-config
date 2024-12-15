return {
    { "williamboman/mason.nvim",           config = function() require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup({ ensure_installed = { "clangd", "gopls", "lua_ls", "pylsp", "sqls", } }) end },
    { "nvimtools/none-ls.nvim", config = function() local null_ls = require("null-ls") null_ls.setup({ sources = { null_ls.builtins.formatting.clang_format, }, }) end},
    { "rachartier/tiny-inline-diagnostic.nvim",event = "VeryLazy", priority = 1000, config = function() require( 'tiny-inline-diagnostic').setup() end},
    { "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.sqls.setup({ capabilities = capabilities })
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "go definition" })
                    vim.keymap.set('n', 'ga', vim.lsp.buf.declaration, opts, { desc = "go declaration" })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "go references" })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "go implementation" })
                    vim.keymap.set('n', 'gn', vim.lsp.buf.type_definition, opts, { desc = "go type definition" })
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "hover" })

                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts, { desc = "add workspace folder to buffer" })
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts, { desc = "remove workspace folder from buffer" })
                    vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts, { desc = "list workspace folders of buffer" })

                    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, opts, { desc = "format file" })
                end
            })
        end
    },
    { "rachartier/tiny-code-action.nvim",
        dependencies = {{ "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" },},
        event = "LspAttach",
        config = function()
            require('tiny-code-action').setup({
                vim.keymap.set("n", "<leader>ca", function() require("tiny-code-action").code_action()
                end, { noremap = true, silent = true, desc = "show code action" })
            })
        end
    },
}
