-- vim.opt_local.makeprg = "python3 %"
vim.opt_local.makeprg = "uv run %"


vim.keymap.set("n", "<leader>mr",
    "<cmd>w<CR>" ..
    -- "<cmd>Make; read<CR>" ..
    -- "<cmd>!tmux split-window -v" ..
    "<cmd>split term://" ..
    "uv run " .. "%<CR>"..
    "<cmd>resize 20<CR>",
    { desc = "Run" }
)

