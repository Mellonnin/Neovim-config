vim.opt_local.makeprg = "$CATALINA_HOME/bin/startup.sh"
vim.b.dispatch = "$CATALINA_HOME/bin/shutdown.sh"

vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>Make!<CR>",
  { desc = "Deploy" }
)

vim.keymap.set("n", "<leader>ms",
  "<cmd>w<CR>" ..
  "<cmd>Dispatch!<CR>",
  { desc = "Shutdown" }
)



