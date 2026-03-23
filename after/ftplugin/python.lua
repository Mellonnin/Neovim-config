-- vim.opt_local.makeprg = "python3 %"
vim.opt_local.makeprg = "uv run %"


vim.keymap.set("n", "<leader>cm",
    "<cmd>w<CR>" ..
    "<cmd>Make<CR>",
    -- "<cmd>split term://" ..
    -- "uv run " .. "%<CR>"..
    -- "<cmd>resize 20<CR>",
    { desc = "Run" }
)

