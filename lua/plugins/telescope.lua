return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "brookhong/telescope-pathogen.nvim",
            "mollerhoj/telescope-recent-files.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown {} },
                    ["pathogen"] = {
                        attach_mappings = function(map, actions)
                            map("i", "<C-k>", actions.proceed_with_parent_dir)
                            map("i", "<C-j>", actions.revert_back_last_dir)
                            map("i", "<C-l>", actions.change_working_directory)
                            map("i", "<C-g>", actions.grep_in_result)
                            map("i", "<C-i>", actions.invert_grep_in_result)
                        end,
                        use_last_search_for_live_grep = false, -- remove below if you want to enable it
                        -- quick_buffer_characters = "asdfgqwertzxcvb",
                        prompt_prefix_length = 100
                    }
                },
            })

            require('telescope').load_extension('fzf')
            local builtin = require("telescope.builtin")
            local recent_file = require("telescope").load_extension("recent-files")
            local pathogen = require("telescope").load_extension("pathogen")

            vim.keymap.set("n", "<leader>fs", pathogen.grep_string, { desc = "search current word" })
            vim.keymap.set("n", "<leader>fw", pathogen.live_grep, { desc = "search word " })
            vim.keymap.set("n", "<leader>ff", pathogen.find_files, { desc = "search files" })
            vim.keymap.set("n", "<leader>fr", function() recent_file.recent_files({}) end,
                { desc = "fuzzy find recent files" })
            vim.keymap.set("n", "<leader>fe", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { winblend = 10, previewer = false, })
            end, { desc = "fuzzily search in current buffer" })
            vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "search buffers" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "search diagnostics" })
        end
    },
}
