vim.opt_local.makeprg = "uv run %"
vim.b.dispatch = "uv run pyinstaller bin ./*/__main__.py"

vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Dispatch!<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>Make!<CR>",
  { desc = "Run" }
)
