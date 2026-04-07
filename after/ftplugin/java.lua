vim.opt_local.makeprg = "javac %"
vim.opt_local.errorformat= "%A%f:%l:%m,%-Z%p^,%-C%.%#"


vim.keymaps.set("n", "<leader>cm",
  "<cmd>w<CR>" ..
  "<cmd>Make<CR>",
  { desc = "Compile" }
)

vim.keymaps.set("n", "<leader>cr",
  "<cmd>w<CR>" ..
  "<cmd>split term://" ..
  "java ".. "%:r<CR>".. -- :r toglie il filetype dal comando
  "<cmd>resize 20<CR>",
  { desc = "Run" }
)

				-- ":w<CR>:split term://" .. command .. " %<CR>:resize 10<CR>",
