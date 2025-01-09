return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            CustomOilBar = function()
                local path = vim.fn.expand "%"
                path = path:gsub("oil://", "")
                return "  " .. vim.fn.fnamemodify(path, ":.")
            end

            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<C-H>"] = false,
                    ["<Esc>"] = false,
                },
                view_options = {
                    show_hidden = true,
                },
            }

            vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" }) -- Open parent directory in current window

            -- Open parent directory in floating window
            vim.keymap.set("n", "<leader>_", require("oil").toggle_float, { desc = "open directory in floating window" })
        end,
    },
}
