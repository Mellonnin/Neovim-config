return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope.nvim'
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()
        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        --     local file_paths = {}
        --     for _, item in ipairs(harpoon_files.items) do
        --         table.insert(file_paths, item.value)
        --     end
        --     require("telescope.pickers").new({}, {
        --         prompt_title = "Harpoon",
        --         finder = require("telescope.finders").new_table({
        --             results = file_paths,
        --         }),
        --         previewer = conf.file_previewer({}),
        --         sorter = conf.generic_sorter({}),
        --     }):find()
        -- end
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon add list" })
        vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "toggle harpoon menu" })
        vim.keymap.set("n", "<C-e>", function() harpoon:list():prev() end, { remap = true, desc = "prev harpoon item" })
        vim.keymap.set("n", "<C-r>", function() harpoon:list():next() end, { remap = true, desc = "next harpoon item" })
    end
}
