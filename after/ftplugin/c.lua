vim.opt_local.makeprg = "gcc -Wall -Wextra -Wshadow -Werror % -o %:r"

vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Make<CR>",
  { desc = "Compile" }
)
vim.keymap.set("n", "<leader>mr",
    "<cmd>split term://" ..
    "./%:r<CR>" ..
    "<cmd>resize 20<CR>",
    { desc = "Run" }
)
