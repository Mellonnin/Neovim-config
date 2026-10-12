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
      defaults={
        mappings = {
        i = { ["<C-q>"] = require("telescope.actions").close, },
        n = { ["q"] = require("telescope.actions").close, }
      },
        },
        pickers = {
          find_files = { theme = "ivy" },
          grep_string = { theme = "ivy" },
          live_grep = { theme = "ivy" },
          diagnostics = { theme = "ivy"},
          buffers = { theme = "ivy" },
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
              map("i", "<C-g>o", actions.grep_in_result)
              map("i", "<C-g>i", actions.invert_grep_in_result)
            end,
            use_last_search_for_live_grep = false,
            prompt_prefix_length = 100,
          }
        },
    })

    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local worktree = require("telescope").load_extension("git_worktree")
    local zoxide = require("telescope").load_extension("zoxide")
    local recent_file = require("telescope").load_extension("recent-files")
    local pathogen = require("telescope").load_extension("pathogen")

    vim.keymap.set("n", "<leader>ft", function() worktree.git_worktree({}) end)
    vim.keymap.set("n", "<leader>fk", function() pathogen.find_files({cwd = utils.buffer_dir()}) end, {desc = "search files in cdw"})
    vim.keymap.set("n", "<leader>fw", function() pathogen.live_grep({}) end, {desc = "search word"})
    vim.keymap.set("n", "<leader>fr", function() recent_file.recent_files({require("telescope.themes").get_ivy{}}) end)
    vim.keymap.set("n", "<leader>fi",
      function() builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {}) end,
      { desc = "fuzzily search in current buffer" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "search buffers"})
    vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "search diagnostics"})
    vim.keymap.set("n", "<leader>fd", function() zoxide.list(require("telescope.themes").get_ivy{}) end)
    vim.keymap.set("n", "<leader>ff", function() pathogen.find_files({})end, {desc = "search files"})

-- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
vim.keymap.set("n", "<leader>gc", require'telescope.builtin'.git_commits, { desc = 'Search commits' })
--
-- Lists buffer's git commits with diff preview and checks them out on <cr>
vim.keymap.set("n", "<leader>gn", require'telescope.builtin'.git_bcommits, { desc = 'Search buffer commits'})
--
-- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
-- rebase action<C-r>, create action <C-a>, switch action <C-s>,
-- delete action <C-d> and merge action <C-y>
vim.keymap.set("n", "<leader>gr", require'telescope.builtin'.git_branches, { desc = 'Search branch' })

--Lists current changes per file with diff preview and add action.
vim.keymap.set("n", "<leader>gu", require'telescope.builtin'.git_status, { desc = 'Search status word' })

--Lists stash items in current repository with ability to apply them on <cr>
vim.keymap.set("n", "<leader>ga", require'telescope.builtin'.git_stash, { desc = 'Search stash word' })
-- Fare un comando che mette nella quickfix tutte i merge conflict
vim.keymap.set("n","<leader>gl","/<<<<CR>",{desc="Find conflicts"})
  end
}
