-- actual remaps
vim.g.mapleader = " "
-- best remap ever
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")



-- insert mode
vim.keymap.set({ "i", "c" }, "<C-V>", "<Cs-v>")

-- search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "end highlight search" })
vim.keymap.set("n", "<C-m>", "nzzzv", { desc = "vai al prossimo termine" })
vim.keymap.set("n", "<C-,>", "Nzzzv", { desc = "vai al termine precedente" })

-- visual mode
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })

--normal mode
vim.keymap.set("n", "U", "<C-r>", { desc = "vai al cambiamento successivo" })
vim.keymap.set("", "<C-q>", "<C-d>zz", { desc = "giu meta schermo" })
vim.keymap.set("", "<C-w>", "<C-u>zz", { remap = true, desc = "su meta schermo" })
vim.keymap.set("", "<C-u>", "<C-i>", { desc = "jump list backwards" })
vim.keymap.set("", "<C-i>", "gI", { desc = "i on line 1" })
vim.keymap.set("", "gm", "gn", { desc = "find the previous match with the last used search pattern and Visually select it" })
vim.keymap.set("", "g.", "gN", { desc = "find the next match with the last used search pattern and Visually select it" })



--movement
vim.keymap.set("", "m", "ge", { desc = "move to the end of the previous word" })
vim.keymap.set("", "M", "gE", { desc = "move to the end of the previous WORD" })

vim.keymap.set("", "n", "b", { desc = "move to the begin of the previous word" })
vim.keymap.set("", "N", "B", { desc = "move to the begin of the previous WORD" })

vim.keymap.set("", "L", "g_", { desc = "go to non blank end of the line" })
vim.keymap.set("", "H", "^", { desc = "go to non blank start of the line" })
vim.keymap.set("", "^", "0", { desc = "line begin" })
vim.keymap.set("", "gj", "G", { desc = "buffer bottom" })
vim.keymap.set("", "gk", "gg", { desc = "buffer top" })

vim.keymap.set("", "<C-j>", "<C-f>", { desc = "scroll N screens forward" })
vim.keymap.set("", "<C-k>", "<C-b>", { desc = "scroll N screens backwards" })

vim.keymap.set("", "<C-a>", "g;", { desc = "changelist backwards" })
vim.keymap.set("", "<C-s>", "g,", { desc = "changelist forward" })


-- fast indent/dedenting
vim.keymap.set("n", "<", "<<")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("n", ">", ">>")
vim.keymap.set({ "n", "x" }, "=", "==")

-- comments
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })

-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "inizia a cambiare la parola su cui ero sopra" })

--clipboard
--paste
vim.keymap.set("", "<leader>p", [["+p]], { desc = "paste nella clipboard di sistema" })
vim.keymap.set("", "<leader>P", [["+P]], { desc = "Paste nella clipboard di sistema" })
--yoink
vim.keymap.set("", "<leader>y", [["+y]], { desc = "yank nella clipboard di sistema" })
vim.keymap.set("", "<leader>Y", [["+y$]], { desc = "Yank nella clipboard di sistema dal cursore in poi" })
vim.keymap.set("", "Y", "y$", { desc = "yank dal cursore in poi" })

--delete
vim.keymap.set("", "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keymap.set("", "<leader>D", [["_D]], { desc = "delete dal cursore in poi senza andare nella clipboard di nvim" })
vim.keymap.set("", "<C-d>", [["+d]], { desc = "delete della clipboard di sistema" })




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
vim.keymap.set('x', 'Q', "mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'", { silent = true, expr = true, desc = ':help v_Q-default' })
vim.keymap.set('x', '@', "mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'", { silent = true, expr = true, desc = ':help v_@-default' })
