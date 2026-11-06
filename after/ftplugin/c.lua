vim.opt_local.makeprg = "gcc -Wall -Wextra -Wshadow -Werror % -o %:r"
vim.b.dispatch = "./%:r"

vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Make!<CR>",
  { desc = "Compile" }
)
vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>Dispatch! CR>",
  { desc = "Run" }
)
