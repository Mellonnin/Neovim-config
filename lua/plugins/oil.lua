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
                    ["g?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = { "actions.close", mode = "n" },
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["~"] = { "actions.cd", mode = "n" },
                    ["g\\"] = { "actions.toggle_trash", mode = "n" },
                },
                use_default_keymaps = false,
                view_options = {
                    show_hidden = true,
                },
            }
        end,
    },

    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" },
    }
}
