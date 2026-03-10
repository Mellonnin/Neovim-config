vim.opt_local.makeprg = "javac %"
vim.opt_local.errorformat= "%A%f:%l:%m,%-Z%p^,%-C%.%#"


vim.keymap.set("n", "<leader>cc",
  "<cmd>w<CR>" ..
  "<cmd>make<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>cr",
  "<cmd>w<CR>" ..
  "<cmd>!java %<CR>",
  { desc = "Run" }
)


				-- ":w<CR>:split term://" .. command .. " %<CR>:resize 10<CR>",
