vim.opt_local.makeprg = "gcc -Wall -Wextra -Wshadow -Werror % -o %:r"

vim.keymap.set("n", "<leader>cc",
  "<cmd>w<CR>" ..
  "<cmd>make<CR>",
  { desc = "Compile" }
)
vim.keymap.set("n", "<leader>cr",
    "<cmd>vsplit term://" ..
    "./%:r<CR>" ..
    "<cmd>vertical resize 50<CR>",
    { desc = "Run" }
)
