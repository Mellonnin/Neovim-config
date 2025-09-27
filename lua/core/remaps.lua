-- best remap ever
vim.keyamps.set({ "i", "c","t" }, "<C-l>", "<Right>")
vim.keyamps.set({ "i", "c","t" }, "<C-f>", "<del>", {noremap=true})
-- :cmap  :cnoremap :cunmap    Command-line
-- :tmap  :tnoremap :tunmap    Terminal
-- CTRL-D		delete one shiftwidth of indent in the current line
-- CTRL-T		insert one shiftwidth of indent in current line
-- CTRL-O		execute a single command and return to insert mode
-- CTRL-U		delete all entered characters in the current line
-- CTRL-W		delete word before the cursor

-- search
vim.keyamps.set("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "end highlight search" })
vim.keyamps.set({"n","v"}, "<C-n>", "nzzzv", { noremap=true, desc = "vai al prossimo termine" })
vim.keyamps.set({"n","v"}, "<C-m>", "Nzzzv", { noremap= true,desc = "vai al termine precedente" })

vim.keyamps.set({"n","v"}, "m", "ge", { noremap = true,desc = "move to the end of the previous word" })
vim.keyamps.set({"n","v"}, "M", "gE", { noremap = true,desc = "move to the end of the previous WORD" })
vim.keyamps.set({"n","v"}, "n", "b" , {noremap = true,desc = "move to the begin of the previous word" })
vim.keyamps.set({"n","v"}, "N", "B", { noremap = true,desc = "move to the begin of the previous WORD" })

vim.keyamps.set({"n","v"}, "gm", "gN", { desc = "find the prev match with the last used search pattern and Visually select it" })

-- visual mode
vim.keyamps.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keyamps.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })
vim.keyamps.set({"n","v"}, "gp", "`[v`]", { desc = "select previously pasted region" })
--normal mode
vim.keyamps.set({"n","v"}, "U", "<C-r>", { desc = "vai al cambiamento successivo" })

vim.keyamps.set({"n","v"}, "<C-j>", "<C-u>zz", { desc = "giu meta schermo" })
vim.keyamps.set({"n","v"}, "<C-k>", "<C-d>zz", { desc = "su meta schermo" })

vim.keyamps.set({"n","v"}, "<C-f>", "gf", { desc = "change file with name under cursor" })

vim.keyamps.set({"n","v"}, "<C-a>", "g;", { desc = "changelist backwards" })
vim.keyamps.set({"n","v"}, "<C-s>", "g,", { desc = "changelist forward" })



vim.keyamps.set({"n","v"}, "L", "g_", { desc = "go to non blank end of the line" })
vim.keyamps.set({"n","v"}, "H", "^", { desc = "go to non blank start of the line" })
vim.keyamps.set({"n","v"}, "^", "0", { desc = "line begin" })


-- fast indent/dedenting
vim.keyamps.set({"n","v"}, "<", "<<")
vim.keyamps.set("x", "<", "<gv")
vim.keyamps.set("x", ">", ">gv")
vim.keyamps.set({"n","v"}, ">", ">>")
vim.keyamps.set({ "n", "x","v" }, "=", "==")

-- comments
vim.keyamps.set("n", "<C-c>", "gcc", { remap = true })
vim.keyamps.set("x", "<C-c>", "gc", { remap = true })
-- inizia a cambiare la parola su cui ero sopra
vim.keyamps.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc = "substitute words over the cursor"})

--clipboard
--paste
vim.keyamps.set({"n","v"}, "<leader>p", [["+p]], { desc = "paste nella clipboard di sistema" })
vim.keyamps.set({"n","v"}, "<leader>P", [["+P]], { desc = "Paste nella clipboard di sistema" })
--yoink
vim.keyamps.set({"n","v"}, "<leader>y", [["+y]], { desc = "yank nella clipboard di sistema" })
vim.keyamps.set({"n","v"}, "<leader>Y", [["+y$]], { desc = "Yank nella clipboard di sistema dal cursore in poi" })
vim.keyamps.set({"n","v"}, "Y", "y$", { desc = "yank dal cursore in poi" })

--delete
vim.keyamps.set({"n","v"}, "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keyamps.set({"n","v"}, "<leader>D", [["_D]], { desc = "delete dal cursore in poi senza andare nella clipboard di nvim" })




--macro
-- vim.keymap.set('x', 'Q', "mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'",
--     { silent = true, expr = true, desc = ':help v_Q-default' })
-- vim.keymap.set('x', '@', "mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'",
--     { silent = true, expr = true, desc = ':help v_@-default' })
