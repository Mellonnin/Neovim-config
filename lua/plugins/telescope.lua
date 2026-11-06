return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "jvgrootveld/telescope-zoxide",
      "mollerhoj/telescope-recent-files.nvim",
      "brookhong/telescope-pathogen.nvim",
      "mrloop/telescope-git-branch.nvim",
      "Snikimonkd/telescope-git-conflicts.nvim",
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
          zoxide = { mappings = { default = { after_action = z_utils.create_basic_command("Oil"), }, } },
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
          },
        },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local worktree = require("telescope").load_extension("git_worktree")
    local zoxide = require("telescope").load_extension("zoxide")
    local recent_file = require("telescope").load_extension("recent-files")
    local diff_branch = require('telescope').load_extension("git_branch")
    local pathogen = require("telescope").load_extension("pathogen")
    local conflict = require("telescope").load_extension("conflicts")
    vim.keymap.set("n", "<leader>ft", function() worktree.git_worktree({}) end)
    vim.keymap.set("n", "<leader>wc", function() worktree.create_git_worktree({}) end)
    vim.keymap.set("n", "<leader>fd", function() zoxide.list(require("telescope.themes").get_ivy{}) end)
    --
    vim.keymap.set("n", "<leader>fw", function() pathogen.live_grep({}) end, {desc = "search word"})
    vim.keymap.set("n", "<leader>fw", function() pathogen.grep_string({}) end, {desc = "search word"})
    vim.keymap.set("n", "<leader>fr", function() recent_file.recent_files({require("telescope.themes").get_ivy{}}) end)

    vim.keymap.set("n", "<leader>fk", function() builtin.find_files({cwd = utils.buffer_dir()}) end, {desc = "search files in cdw"})
    vim.keymap.set("n", "<leader>fi", function() builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {preview=false}) end, { desc = "fuzzily search in current buffer" })
    vim.keymap.set("n", "<leader>ff", function() pathogen.find_files({})end, {desc = "search files"})


    vim.keymap.set("n","<leader>gr",function() require("telescope.builtin").lsp_references()end)
    vim.keymap.set("n","<leader>gc",function() require("telescope.builtin").lsp_incoming_calls()end)
    vim.keymap.set("n","<leader>go",function() require("telescope.builtin").lsp_outgoing_calls()end)
    vim.keymap.set("n","<leader>gl",function() require("telescope.builtin").lsp_implementations() end )
    vim.keymap.set("n","<leader>gj",function() require("telescope.builtin").lsp_definitions() end )
    vim.keymap.set("n","<leader>gk",function() require("telescope.builtin").lsp_type_definitions() end )

    -- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = 'Search commits' })

    -- Lists buffer's git commits with diff preview and checks them out on <cr>
    vim.keymap.set("n", "<leader>gn", builtin.git_bcommits, { desc = 'Search buffer commits'})
    vim.keymap.set("n", "<leader>gd", function() diff_branch.file() end)
    vim.keymap.set("n", "<leader>gf", function() conflict.conflicts() end)

    -- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
    -- rebase action<C-r>, create action <C-a>, switch action <C-s>,
    -- delete action <C-d> and merge action <C-y>
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = 'Search branch' })

    --Lists current changes per file with diff preview and add action.
    vim.keymap.set("n", "<leader>gu", builtin.git_status, { desc = 'Search status word' })

    --Lists stash items in current repository with ability to apply them on <cr>
    vim.keymap.set("n", "<leader>ga", builtin.git_stash, { desc = 'Search stash word' })

  end
}
