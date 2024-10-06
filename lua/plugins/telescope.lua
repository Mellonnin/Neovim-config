return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'mollerhoj/telescope-recent-files.nvim',
        },

        config = function()
            local builtin = require("telescope.builtin")
            require("telescope").load_extension("recent-files")
            local actions = require("telescope.actions")
            local recent_file = require('telescope').extensions['recent-files']
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    },
                    fzf = {
                        fuzzy = false,                  -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                        --'wild 	exact-match (quoted) 	Items that include wild
                        --^music 	prefix-exact-match 	Items that start with music
                        --.mp3$ 	suffix-exact-match 	Items that end with .mp3
                        --!fire 	inverse-exact-match 	Items that do not include fire
                        --!^music 	inverse-prefix-exact-match 	Items that do not start with music
                        --!.mp3$ 	inverse-suffix-exact-match 	Items that do not end with .mp3
                        --A single bar character term acts as an OR operator.
                        --the following query matches entries that start with core and end with either go, rb, or py.
                        --^core go$ | rb$ | py$
                    }
                },
            })
            pcall(require("telescope").load_extension, 'fzf')
            pcall(require("telescope").load_extension, 'ui-select')

            vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = 'Search word ' })
            vim.keymap.set('n', '<leader>sg', builtin.grep_string, { desc = 'Search current word' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
            vim.keymap.set('n', '<leader>ff', function() recent_file.recent_files({}) end,
                { noremap = true, silent = true })

            vim.keymap.set('n', '<leader>s.', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10, previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, {
                desc = 'Search commits '
                -- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
            })
            vim.keymap.set("n", "<leader>cb", builtin.git_bcommits, {
                desc = 'Search buffer commits '
                -- Lists buffer's git commits with diff preview and checks them out on <cr>
            })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, {
                desc = 'Search branch '
                -- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
                -- rebase action<C-r>, create action <C-a>, switch action <C-s>,
                -- delete action <C-d> and merge action <C-y>
            })
            vim.keymap.set("n", "<leader>gt", builtin.git_status, {
                desc = 'Search status word '
                --Lists current changes per file with diff preview and add action.
            })
            vim.keymap.set("n", "<leader>gs", builtin.git_stash, {
                desc = 'Search stash word '
                --Lists stash items in current repository with ability to apply them on <cr>
            })
        end
    },
}
