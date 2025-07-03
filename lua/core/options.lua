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
vim.o.splitright = true
vim.diagnostic.config({ virtual_text = true })




local aug = function(group_name, clear)
    clear = vim.F.if_nil(clear, true)
    return vim.api.nvim_create_augroup(group_name, { clear = clear })
end
local au = vim.api.nvim_create_autocmd

au("BufReadPost", {
    group = aug("last_loc"),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

local function smart_delete(key)
 local l = vim.api.nvim_win_get_cursor(0)[1] -- Get the current cursor line number
 local line = vim.api.nvim_buf_get_lines(0, l - 1, l, true)[1] -- Get the content of the current line
 return (line:match("^%s*$") and '"_' or "") .. key -- If the line is empty or contains only whitespace, use the black hole register
end

local keys = { "d", "x", "c", "s", "C", "S", "X","D" } -- Define a list of keys to apply the smart delete functionality
-- Set keymaps for both normal and visual modes
for _, key in pairs(keys) do
 vim.keymap.set({ "n", "v" }, key, function()
  return smart_delete(key)
 end, { noremap = true, expr = true, desc = "Smart delete" })
end
