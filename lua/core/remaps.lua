-- best remap ever
vim.keymap.set({ "i", "c","t" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c","t" }, "<C-f>", "<del>", {noremap=true})
vim.keymap.set({ "i", "c","t" }, "<C-e>", "<C-o>w<C-o>dw", {noremap=true, desc = "delete word after the cursor"})
vim.keymap.set({ "i", "c","t" }, "<C-a>", "<c-o>D", {noremap=true, desc = "delete all characters after the cursor"})

-- CTRL-H delete	
-- CTRL-M newline	
-- CTRL-i insert tab	
-- CTRL-G+ j/k go down/up
-- CTRL-U		delete all entered characters in tcurrent line
-- CTRL-W		delete word before the cursor
-- :tmap  :tnoremap :tunmap    Terminal
-- :cmap  :cnoremap :cunmap    Command-line
-- CTRL-T		insert one shiftwidth of indent in current line
-- CTRL-D		delete one shiftwidth of indent in the current line
-- CTRL-O		execute a single command and return to insert mode

-- search
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>", { desc = "end highlight search" })
vim.keymap.set({"n","v"}, "<C-n>", "nzzzv", { noremap=true, desc = "vai al prossimo termine" })
vim.keymap.set({"n","v"}, "<C-b>", "Nzzzv", { noremap= true,desc = "vai al termine precedente" })

-- vim.keymap.set('x', '<C-n>', '<C-\\><C-n>`</\\%V', { desc = 'Search forward within visual selection' })
-- vim.keymap.set('x', '<C-b>', '<C-\\><C-n>`>?\\%V', { desc = 'Search backward within visual selection' })

vim.keymap.set({"n","v"}, "n", "ge", { remap = true,desc = "move to the end of the previous word" })
vim.keymap.set({"n","v"}, "N", "gE", { remap = true,desc = "move to the end of the previous WORD" })
vim.keymap.set({"n","v"}, "gb", "gN", { desc = "find the prev match with the last used search pattern and Visually select it" })

vim.keymap.set({"n"}, "<S-enter>", "T.i<enter><C-o>A", { noremap = true,desc = "" })
vim.keymap.set({"i"}, "<S-enter>", "<esc>T.i<enter><C-o>A", { noremap = true,desc = "" })
vim.keymap.set({"i"}, "<C-S-j>", "<esc>T.i<enter><C-o>A", { noremap = true,desc = "" })


-- visual mode
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })
vim.keymap.set({"n","v","x"}, "gp", "'[V']", { desc = "select previously pasted region" })

--custom texts
vim.keymap.set({"x", "o"}, "i|", ":<C-u>normal! T|vt|<CR>", { desc = "inner block from | to |", noremap = true, silent = true })
vim.keymap.set({"x", "o"}, "a|", ":<C-u>normal! f|F|vf|<CR>", { desc = "block from | to |", noremap = true, silent = true })


--normal mode
vim.keymap.set({"n","v"}, "U", "<C-r>", { desc = "vai al cambiamento successivo" })

vim.keymap.set({"n","v"}, "<C-j>", "<C-d>zz", { desc = "giu meta schermo" })
vim.keymap.set({"n","v"}, "<C-k>", "<C-u>zz", { desc = "su meta schermo" })

vim.keymap.set({"n","v"}, "<C-a>", "g;", { desc = "changelist backwards" })
vim.keymap.set({"n","v"}, "<C-s>", "g,", { desc = "changelist forward" })


vim.keymap.set("n","<leader>b",":ls :b ",{desc = "list buffers" })


vim.keymap.set({"n","v"}, "L", "g_", { desc = "go to non blank end of the line" })
vim.keymap.set({"n","v"}, "H", "^", { desc = "go to non blank start of the line" })
vim.keymap.set({"n","v"}, "^", "0", { desc = "line begin" })


-- fast indent/dedenting
vim.keymap.set({"n","v"}, "<", "<<")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set({"n","v"}, ">", ">>")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set({ "n", "x","v" }, "=", "==")

-- comments
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })

-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc = "substitute words over the cursor"})

--quickfix
vim.keymap.set("n", "<leader>qs", [[:cdo s//c/gc<Left><Left><Left><Left><Left>]],{desc = "quickfix select word to change"})

--clipboard
--paste
vim.keymap.set({"n","v"}, "<leader>p", [["+p]], { desc = "paste nella clipboard di sistema" })
vim.keymap.set({"n","v"}, "<leader>P", [["+P]], { desc = "Paste nella clipboard di sistema" })

--yoink
vim.keymap.set({"n","v"}, "<leader>y", [["+y]], { desc = "yank nella clipboard di sistema" })
vim.keymap.set({"n","v"}, "<leader>Y", [["+y$]], { desc = "Yank nella clipboard di sistema dal cursore in poi" })
vim.keymap.set({"n","v"}, "Y", "y$", { desc = "yank dal cursore in poi" })

--delete
vim.keymap.set({"n","v"}, "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keymap.set({"n","v"}, "<leader>D", [["_D]], { desc = "delete dal cursore in poi senza andare nella clipboard di nvim" })

--change
vim.keymap.set({"n","v"}, "<leader>c", [["_c]], { desc = "change non va nella clipboard di nvim" })
vim.keymap.set({"n","v"}, "<leader>C", [["_C]], { desc = "change dal cursore in poi senza andare nella clipboard di nvim" })
