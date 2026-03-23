vim.opt_local.makeprg = "javac %"
vim.opt_local.errorformat= "%A%f:%l:%m,%-Z%p^,%-C%.%#"


vim.keymap.set("n", "<leader>cm",
  "<cmd>w<CR>" ..
  "<cmd>Make<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>cr",
  "<cmd>w<CR>" ..
  "<cmd>split term://" ..
  "java ".. "%:r<CR>".. -- :r toglie il filetype dal comando
  "<cmd>resize 20<CR>",
  { desc = "Run" }
)

				-- ":w<CR>:split term://" .. command .. " %<CR>:resize 10<CR>",
