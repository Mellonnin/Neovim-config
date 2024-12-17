-- actual remaps
vim.g.mapleader = " "
-- best remap ever
vim.keymap.set("i", "<C-l>", "<Right>")
-- search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "end highlight search" })
vim.keymap.set("n", "n", "nzzzv",{desc = "vai al prossimo termine" })
vim.keymap.set("n", "N", "Nzzzv",{desc = "vai al termine precedente" })
-- visual mode
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", {desc = "move hightlighted line up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", {desc = "move hightlighted line down" })
--normal mode
vim.keymap.set("n", "<C-q>", "<C-d>zz", {desc = "giu meta schermo" })
vim.keymap.set("n", "<C-w>", "<C-u>zz", {desc = "su meta schermo" })
vim.keymap.set("n", "U", "<C-r>", {desc = "vai al cambiamento successivo" })

--movement
vim.keymap.set({ "n", "v" }, "m", "ge",{desc="move to the end of the previous word"})
vim.keymap.set({ "n", "v" }, "M", "gE",{desc="move to the end of the previous WORD"})
vim.keymap.set({ "n", "v" }, "L", "g_",{desc="go to non blank end of the line"})
vim.keymap.set({ "n", "v" }, "gj", "G",{desc="buffer bottom"})
vim.keymap.set({ "n", "v" }, "gh","0",{desc="line begin"})
vim.keymap.set({ "n", "v" }, "_", "-",{desc="line up on first non-blank"})
-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "inizia a cambiare la parola su cui ero sopra" })
--clipboard
--paste
vim.keymap.set("x", "<C-p>", [["_dP]], { desc = "continua ad incollare quello nel buffer senza perdere" })
vim.keymap.set({"n","v"}, "<leader>p", [["+p]], {desc = "paste nella clipboard di sistema"})
vim.keymap.set({"n","v"}, "<leader>P", [["+P]], {desc = "paste nella clipboard di sistema"})
--yoink
vim.keymap.set({"n","v"}, "<leader>y", [["+y]], {desc = "copia nella clipboard di sistema"})
vim.keymap.set({"n","v"}, "<leader>Y", [["+Y]], {desc = "copia nella clipboard di sistema dal cursore in poi"})
--delete
vim.keymap.set({"n","v"}, "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keymap.set({"n","v"}, "<leader>D", [["_D]], { desc = "delete dal cursore in poi senza andare nella clipboard di nvim" })
vim.keymap.set({"n","v"}, "<C-d>", [["+d]], { desc = "delete della clipboard di sistema" })
