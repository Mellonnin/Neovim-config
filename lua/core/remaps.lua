-- best remap ever
vim.keymap.set({ "i", "c","t" }, "<C-e>", "<C-o>w<C-o>dw", {noremap=true, desc = "delete word after the cursor"})
vim.keymap.set({ "i", "c","t" }, "<C-a>", "<c-o>D", {noremap=true, desc = "delete all characters after the cursor"})
-- CTRL-H delete	
-- CTRL-M newline	
-- CTRL-i insert tab	
-- CTRL-G+ j/k go down/up
-- CTRL-U		delete all entered characters in tcurrent line
-- CTRL-W		delete word before the cursor
-- CTRL-T		insert one shiftwidth of indent in current line
-- CTRL-D		delete one shiftwidth of indent in the current line
-- CTRL-O		execute a single command and return to insert mode

-- search
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<CR>", { desc = "end highlight search" })
vim.keymap.set({"n","x"}, "<C-n>", "nzzzv", { noremap=true, desc = "vai al prossimo termine" })
vim.keymap.set({"n","x"}, "<C-p>", "Nzzzv", { noremap= true,desc = "vai al termine precedente" })


vim.keymap.set({"n","x"}, "n", "ge", { remap = true,desc = "move to the end of the previous word" })
vim.keymap.set({"n","x"}, "N", "gE", { remap = true,desc = "move to the end of the previous WORD" })


vim.keymap.set({"n"}, "<S-enter>", "T.i<enter><C-o>A", { noremap = true,desc = "" })
vim.keymap.set({"i"}, "<S-enter>", "<esc>T.i<enter><C-o>A", { noremap = true,desc = "" })
vim.keymap.set({"i"}, "<C-S-m>", "<esc>T.i<enter><C-o>A", { noremap = true,desc = "" })


-- visual mode
vim.keymap.set("x", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keymap.set("x", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })

vim.keymap.set({"n","x"}, "sp", "'[V']", { desc = "select previously pasted region" })
vim.keymap.set({"n","x"}, "sn", "gN", { desc = "find the prev match with the last used search pattern and Visually select it" })
vim.keymap.set({"n","x"}, "sv", "gv")

--normal mode
vim.keymap.set({"n","x"}, "U", "<C-r>", { desc = "vai al cambiamento successivo" })

vim.keymap.set({"n","x"}, "<C-d>", "<C-d>zz", { desc = "giu meta schermo" })
vim.keymap.set({"n","x"}, "<C-u>", "<C-u>zz", { desc = "su meta schermo" })

vim.keymap.set({"n","x"}, "<C-m>", "g;", { desc = "changelist backwards" })
vim.keymap.set({"n","x"}, "<C-,>", "g,", { desc = "changelist forward" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>b",":ls :b <CR>",{desc = "list buffers" })


vim.keymap.set({"n","x"}, "`", "g_", { nowait=true, desc = "go to non blank end of the line" })


-- fast indent/dedenting
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", ">ap", "ma>ap'a")
vim.keymap.set("n", "<ap", "ma<ap'a")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- comments
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })

-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc = "substitute words over the cursor"})

--quickfix
vim.keymap.set("n", "<leader>qs", [[:cdo s//c/gc<Left><Left><Left><Left><Left>]],{desc = "quickfix select word to change"})

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
-- vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
-- vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
-- vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

--clipboard
--paste
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "paste nella clipboard di sistema" })
vim.keymap.set("x", "<leader>p", [["_dp]])
vim.keymap.set({"n","x"}, "<leader>P", [["+P]], { desc = "Paste nella clipboard di sistema" })

--yoink
vim.keymap.set({"n","x"}, "<leader>y", [["+y]], { desc = "yank nella clipboard di sistema" })
vim.keymap.set({"n","x"}, "<leader>Y", [["+y$]], { desc = "Yank nella clipboard di sistema dal cursore in poi" })
vim.keymap.set({"n","x"}, "Y", "y$", { desc = "yank dal cursore in poi" })

--delete
vim.keymap.set({"n","x"}, "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keymap.set({"n","x"}, "<leader>D", [["_D]], { desc = "delete dal cursore in poi senza andare nella clipboard di nvim" })

--change
vim.keymap.set({"n","x"}, "<leader>c", [["_c]], { desc = "change non va nella clipboard di nvim" })
vim.keymap.set({"n","x"}, "<leader>C", [["_C]], { desc = "change dal cursore in poi senza andare nella clipboard di nvim" })
