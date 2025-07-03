-- best remap ever
vim.keymap.set({ "i", "c","t" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c","t" }, "<C-f>", "<del>", {noremap=true})
-- :cmap  :cnoremap :cunmap    Command-line
-- :tmap  :tnoremap :tunmap    Terminal
-- CTRL-D		delete one shiftwidth of indent in the current line
-- CTRL-T		insert one shiftwidth of indent in current line
-- CTRL-O		execute a single command and return to insert mode
-- CTRL-U		delete all entered characters in the current line
-- CTRL-W		delete word before the cursor

-- search
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "end highlight search" })
vim.keymap.set({"n","v"}, "<C-n>", "nzzzv", {noremap=true, desc = "vai al prossimo termine" })
vim.keymap.set({"n","v"}, "<C-m>", "Nzzzv", { noremap= true,desc = "vai al termine precedente" })

vim.keymap.set({"n","v"}, "m", "ge", { noremap = true,desc = "move to the end of the previous word" })
vim.keymap.set({"n","v"}, "M", "gE", { noremap = true,desc = "move to the end of the previous WORD" })
vim.keymap.set({"n","v"}, "n", "b" , {noremap = true,desc = "move to the begin of the previous word" })
vim.keymap.set({"n","v"}, "N", "B", { noremap = true,desc = "move to the begin of the previous WORD" })

vim.keymap.set({"n","v"}, "gm", "gN", { desc = "find the prev match with the last used search pattern and Visually select it" })

-- visual mode
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })

--normal mode
vim.keymap.set({"n","v"}, "U", "<C-r>", { desc = "vai al cambiamento successivo" })

vim.keymap.set({"n","v"}, "<C-j>", "<C-f>", { desc = "giu meta schermo" })
vim.keymap.set({"n","v"}, "<C-k>", "<C-b>", { desc = "su meta schermo" })


vim.keymap.set({"n","v"}, "<C-f>", "gf", { desc = "change file with name under cursor" })


vim.keymap.set({"n","v"}, "<C-a>", "g;", { desc = "changelist backwards" })
vim.keymap.set({"n","v"}, "<C-s>", "g,", { desc = "changelist forward" })

vim.keymap.set({"n","v"}, "<C-i>", "gI", { desc = "i on line 1" })

vim.keymap.set({"n","v"}, "L", "g_", { desc = "go to non blank end of the line" })
vim.keymap.set({"n","v"}, "H", "^", { desc = "go to non blank start of the line" })
vim.keymap.set({"n","v"}, "^", "0", { desc = "line begin" })


-- fast indent/dedenting
vim.keymap.set({"n","v"}, "<", "<<")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set({"n","v"}, ">", ">>")
vim.keymap.set({ "n", "x","v" }, "=", "==")

-- comments
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })
-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc = "substitute words over the cursor"})

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

-- diagnostics
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
if vim.fn.has("nvim-0.11") == 0 then
    vim.diagnostic.jump = function(opts)
        local count = opts.count
        opts.count = nil
        if count > 0 then
            opts.count = nil
            for _ = 1, count do
                vim.diagnostic.goto_next(opts)
            end
        else
            opts.count = nil
            for _ = 1, -count do
                vim.diagnostic.goto_prev(opts)
            end
        end
    end
end


vim.keymap.set({ "n", "x" }, "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "x" }, "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev Diagnostic" })



--macro
-- vim.keymap.set('x', 'Q', "mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'",
--     { silent = true, expr = true, desc = ':help v_Q-default' })
-- vim.keymap.set('x', '@', "mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'",
--     { silent = true, expr = true, desc = ':help v_@-default' })
