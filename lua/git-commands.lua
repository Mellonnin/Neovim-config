vim.keymap.set("n", "<leader>gh", vim.cmd.Git, { desc = "git stash" })

vim.keymap.set("n", "<leader>gg", function()
    require('gitgraph').draw({}, { all = true, max_count = 5000 })
end, { desc = "GitGraph - Draw" })

-- Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
vim.keymap.set("n", "<leader>gc", require'telescope.builtin'.git_commits, { desc = 'Search commits' })

-- Lists buffer's git commits with diff preview and checks them out on <cr>
vim.keymap.set("n", "<leader>gf", require'telescope.builtin'.git_bcommits, { desc = 'Search buffer commits'})

-- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
-- rebase action<C-r>, create action <C-a>, switch action <C-s>,
-- delete action <C-d> and merge action <C-y>
vim.keymap.set("n", "<leader>gb", require'telescope.builtin'.git_branches, { desc = 'Search branch' })

--Lists current changes per file with diff preview and add action.
vim.keymap.set("n", "<leader>gt", require'telescope.builtin'.git_status, { desc = 'Search status word' })

--Lists stash items in current repository with ability to apply them on <cr>
vim.keymap.set("n", "<leader>gs", require'telescope.builtin'.git_stash, { desc = 'Search stash word' })
