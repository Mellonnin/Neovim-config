return {
    {"tpope/vim-fugitive", event = "VeryLazy",},
    {
        'lewis6991/gitsigns.nvim', ---???
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        "NeogitOrg/neogit", --???????
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "VeryLazy",
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
        end
    },
    {
        'polarmutex/git-worktree.nvim', -----???
        version = '^2',
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'isakbm/gitgraph.nvim', --????
        event = "VeryLazy",
        opts = {
            symbols = {
                merge_commit = '',
                commit = '',
                merge_commit_end = '',
                commit_end = '',

                GVER = '',
                GHOR = '',
                GCLD = '',
                GCRD = '╭',
                GCLU = '',
                GCRU = '',
                GLRU = '',
                GLRD = '',
                GLUD = '',
                GRUD = '',
                GFORKU = '',
                GFORKD = '',
                GRUDCD = '',
                GRUDCU = '',
                GLUDCD = '',
                GLUDCU = '',
                GLRDCL = '',
                GLRDCR = '',
                GLRUCL = '',
                GLRUCR = '',
            },
            format = {
                timestamp = '%H:%M:%S %d-%m-%Y',
                fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
            },
            hooks = {
                -- Check diff of a commit
                on_select_commit = function(commit)
                    vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
                    vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
                end,
                -- Check diff from commit a -> commit b
                on_select_range_commit = function(from, to)
                    vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
                    vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
                end,
            },
        },
    },

}
