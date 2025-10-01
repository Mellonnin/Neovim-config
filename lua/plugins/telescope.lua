return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-lua/plenary.nvim",
        "brookhong/telescope-pathogen.nvim",
        "mollerhoj/telescope-recent-files.nvim",
        "jvgrootveld/telescope-zoxide",
    },
    config = function()
        local z_utils = require("telescope._extensions.zoxide.utils")
        require("telescope").setup({
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                grep_string = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                diagnostics = {
                    theme = "ivy",
                },
                buffers = {
                    theme = "ivy",
                },
            },
            extensions = {
               zoxide = {
                    mappings = {
                        default = {
                            after_action = z_utils.create_basic_command("Oil"),
                        },
                    }
                },
                pathogen = {
                    attach_mappings = function(map, actions)
                        map("i", "<C-k>", actions.proceed_with_parent_dir)
                        map("i", "<C-j>", actions.revert_back_last_dir)
                        map("i", "<C-l>", actions.change_working_directory)
                        map("i", "<C-g>", actions.grep_in_result)
                        map("i", "<C-i>", actions.invert_grep_in_result)
                    end,
                    use_last_search_for_live_grep = false,
                    prompt_prefix_length = 100
                }
            },
        })
        require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")
        local utils = require("telescope.utils")
        local zoxide = require("telescope").load_extension("zoxide")
        local recent_file = require("telescope").load_extension("recent-files")
        local pathogen = require("telescope").load_extension("pathogen")

        vim.keymap.set("n", "<leader>fk", function() pathogen.find_files({ cwd = utils.buffer_dir() }) end, { desc = "search files in cdw" })
        vim.keymap.set("n", "<leader>fs", pathogen.grep_string, { desc = "search current word" })
        vim.keymap.set("n", "<leader>fw", pathogen.live_grep, { desc = "search word " })
        vim.keymap.set("n", "<leader>ff", pathogen.find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>fr", function() recent_file.recent_files({ require("telescope.themes").get_ivy {} }) end)
        vim.keymap.set("n", "<leader>fe", function() builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { previewer = false }) end,
            { desc = "fuzzily search in current buffer" })
        vim.keymap.set("n", "<leader>fo", builtin.buffers, { desc = "search buffers" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "search diagnostics" })
        vim.keymap.set("n", "<leader>cd", function() zoxide.list(require("telescope.themes").get_ivy {}) end)
    end
}
