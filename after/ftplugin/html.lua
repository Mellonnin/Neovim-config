vim.opt_local.makeprg = "$CATALINA_HOME/bin/startup.sh"

vim.keymap.set("n", "<leader>md",
    "<cmd>w<CR>" ..
    "<cmd>Make<CR>",
    -- "<cmd>!tmux split-window -v" ..
    -- "<cmd>resize 20<CR>",
    { desc = "Deploy" }
)

vim.keymap.set("n", "<leader>ms",

    "<cmd>w<CR>" ..
    "<cmd>split term://" ..
    "$CATALINA_HOME/bin/shutdown.sh <CR>"..
    "<cmd> q<CR>",
    -- "<cmd>resize 20<CR>",
    { desc = "Shutdown" }
)



