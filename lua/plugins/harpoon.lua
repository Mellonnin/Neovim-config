return {
    { "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()
            vim.keymap.set("n", "<leader>ah", function() harpoon:list():add() end, { desc = "harpoon add list" })
            vim.keymap.set("n", "<leader>al", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "toggle harpoon menu" })
            vim.keymap.set("n", "<C-e>", function() harpoon:list():prev() end, { remap = true, desc = "prev harpoon item" })
            vim.keymap.set("n", "<C-r>", function() harpoon:list():next() end, { remap = true, desc = "next harpoon item" })
        end
    },
}
