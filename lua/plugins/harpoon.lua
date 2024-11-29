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
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc="harpoon add list"})
    vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
    {desc = "harpoon list inside telescope"})
    vim.keymap.set("n", "<leader>z", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    {desc="toggle harpoon menu"})
    vim.keymap.set("n", "<C-r>", function() harpoon:list():prev() end,{desc="prev harpoon item"})
    vim.keymap.set("n", "<C-t>", function() harpoon:list():next() end, {desc="next harpoon item"})
    vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end, {desc="harpoon item 1"})
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end, {desc="harpoon item 2"})
    vim.keymap.set("n", "<C-d>", function() harpoon:list():select(3) end, {desc="harpoon item 3"})
    vim.keymap.set("n", "<C-f>", function() harpoon:list():select(4) end, {desc="harpoon item 4"})
  end
}
