vim.opt_local.makeprg = "python3 %"


vim.keymap.set("n", "<leader>cc",
    "<cmd>w<CR>" ..
    "<cmd>make<CR>" ..
    "<cmd>vsplit term://" ..
    "./%:r<CR>" ..
    "<cmd>vertical resize 50<CR>",
    { desc = "Run" }
)
