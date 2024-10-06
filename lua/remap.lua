vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 50

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.colorcolumn = "183"









-- actual remaps
vim.g.mapleader = " "

vim.keymap.set({ "i", "n", "v" }, "<c-c>", "<esc>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>of', vim.diagnostic.open_float, { desc = 'open diagnostics float' })
vim.keymap.set('n', '<leader>sl', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })



--vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<esc>")

-- move things around when hightlighted
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ") -- cursore rimane al proprio posto quando fa j

-- cursore nel mezzo quando salti
vim.keymap.set("n", "<C-s>", "<C-d>zz")
vim.keymap.set("n", "<C-a>", "<C-u>zz")

-- cursore nel mezzo quando cerchi un termine
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- continua ad incollare quello nel buffer senza perdere
vim.keymap.set("x", "P", [["_dP]])

-- tiene separati le due clipboard leader y copia in quella di sistema 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- stessa cosa dei precendi ma con il delete
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "U", "<C-r>")

vim.api.nvim_set_keymap("n", "th", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tk", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})


-- unbinded keymaps 
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set({"n","v"}, "s", "<nop>")
