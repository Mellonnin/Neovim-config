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

            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = 'Search word ' })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Search current word' })
            vim.keymap.set('n', '<leader>ff', function() recent_file.recent_files({}) end,
                { noremap = true, silent = true, desc='fuzzy find recent files'})

            vim.keymap.set('n', '<leader>fc', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10, previewer = false,
                })
            end, { desc = 'Fuzzily search in current buffer' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search buffers' })
            vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = 'Search loclist' })
            vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Search jumplist' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search diagnostics' })
            vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Search quickfix' })
        end

    },
}
