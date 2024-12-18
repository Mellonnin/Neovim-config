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
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.hlsearch = true -- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.colorcolumn = "157"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = ''
vim.diagnostic.config({ virtual_text = false })
