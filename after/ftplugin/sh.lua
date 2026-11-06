vim.opt_local.makeprg = "chmod +x %"
vim.b.dispatch = "./%"

vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Make!<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>Dispatch!<CR>",
  { desc = "Run" }
)

