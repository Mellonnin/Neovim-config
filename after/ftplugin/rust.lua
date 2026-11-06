vim.opt_local.errorformat= "%f:%l:%c: %t%*[^:]: %m,%f:%l:%c: %*\\d:%*\\d %t%*[^:]: %m,%-G%f:%l %s,%-G%*[ ]^,%-G%*[ ]^%*[~],%-G%*[ ]...,%-G,%-Gerror: aborting %.%#,%-Gerror: Could not compile %.%#,%Eerror: %m,%Eerror[E%n]: %m,%Wwarning: %m,%Inote: %m,%C %#--> %f:%l:%c,%-G%\\s%#Downloading%.%#,%-G%\\s%#Compiling%.%#,%-G%\\s%#Finished%.%#,%-G%\\s%#error: Could not compile %.%#,%-G%\\s%#To learn more\\,%.%#"
vim.opt_local.makeprg = "cargo"
vim.b.dispatch = "rustc"

vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Make!<CR>",
  { desc = "Run" }
)
vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>Dispatch!<CR>",
  { desc = "Run" }
)
