return {
    {"tpope/vim-fugitive", event = "VeryLazy",},
    {'lewis6991/gitsigns.nvim', event = "VeryLazy", opts = { signs = { add = { text = '+' }, change = { text = '~' }, delete = { text = '_' }, topdelete = { text = '‾' }, changedelete = { text = '~' }, }, },},
    {"isakbm/gitgraph.nvim", event = "VeryLazy", opts = { symbols = { merge_commit = '', commit = '', merge_commit_end = '', commit_end = '', GVER = '', GHOR = '', GCLD = '', GCRD = '╭', GCLU = '', GCRU = '', GLRU = '', GLRD = '', GLUD = '', GRUD = '', GFORKU = '', GFORKD = '', GRUDCD = '', GRUDCU = '', GLUDCD = '', GLUDCU = '', GLRDCL = '', GLRDCR = '', GLRUCL = '', GLRUCR = '', }, format = { timestamp = '%H:%M:%S %d-%m-%Y', fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' }, }, hooks = { on_select_commit = function(commit) --[[ Check diff of a commit --]] vim.notify('DiffviewOpen ' .. commit.hash .. '^!') vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!') end, on_select_range_commit = function(from, to) --[[ Check diff from commit a -> commit b --]] vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash) vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash) end, }, },},
    {"polarmutex/git-worktree.nvim",version = "^2", event = "VeryLazy", dependencies = { "nvim-lua/plenary.nvim" }},
    {"NeogitOrg/neogit",dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim", }, event = "VeryLazy", config = function() local neogit = require('neogit') neogit.setup {} end},
    {"echasnovski/mini.diff", version = "*",event= "VeryLazy" },
    {"echasnovski/mini-git", version = "*", main = "mini.git", event="VeryLazy"},
}
