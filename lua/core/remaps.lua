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


-- visual mode
vim.keymap.set("x", "K", ":m '<-2<cr>gv=gv", { desc = "move hightlighted line up" })
vim.keymap.set("x", "J", ":m '>+1<cr>gv=gv", { desc = "move hightlighted line down" })



--normal mode
vim.keymap.set({"n","x"}, "U", "<C-r>", { desc = "vai al cambiamento successivo" })
vim.keymap.set({"n","x"}, "<C-d>", "<C-d>zz", { desc = "giu meta schermo" })
vim.keymap.set({"n","x"}, "<C-u>", "<C-u>zz", { desc = "su meta schermo" })
vim.keymap.set({"n","x"}, "<C-a>", "g;", { desc = "changelist backwards" })
vim.keymap.set({"n","x"}, "<C-s>", "g,", { desc = "changelist forward" })
vim.keymap.set("n", "<leader>b",":ls :b <CR>",{desc = "list buffers" })

--marks
vim.keymap.set({"n","x"}, "<C-t>","'z")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({"n","x"}, "`", "mzg_",{ nowait=true, desc = "go to non blank end of the line" })
vim.keymap.set({"n","x"}, "|", "mz|" )
vim.keymap.set({"n","x"}, "$", "mz$" )
vim.keymap.set({"n","x"}, "^", "mz^" )
vim.keymap.set({"n","x"}, "f", "mzf" )
vim.keymap.set({"n","x"}, "t", "mzt" )
vim.keymap.set({"n","x"}, "F", "mzF" )
vim.keymap.set({"n","x"}, "T", "mzT" )


-- last insert position '^
-- last change position '.
-- last affected text area '[ and ']
-- the Visual area '< and '>

-- fast indent/dedenting
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "=ap", "mz=ap'z")
vim.keymap.set("n", ">ap", "mz>ap'z")
vim.keymap.set("n", "<ap", "mz<ap'z")


-- comments
vim.keymap.set("n", "<C-c>", "gcc", { remap = true })
vim.keymap.set("x", "<C-c>", "gc", { remap = true })

-- inizia a cambiare la parola su cui ero sopra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{desc = "substitute words over the cursor"})

--quickfix
vim.keymap.set("n", "<leader>qs", [[:cdo s//c/gc<Left><Left><Left><Left><Left>]],{desc = "quickfix select word to change"})
-- copen
-- cclose
-- cc
-- cnext
-- cprev



--tmux
vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux new tmux-sessionizer -s 0<CR>")
-- vim.keymap.set("n", "<M-j>", "<cmd>silent !tmux new tmux-sessionizer -s 1<CR>")
-- vim.keymap.set("n", "<M-k>", "<cmd>silent !tmux new tmux-sessionizer -s 2<CR>")
-- vim.keymap.set("n", "<M-l>", "<cmd>silent !tmux new tmux-sessionizer -s 3<CR>")

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
vim.keymap.set({"n","x"}, "Ød", [["+d]], { desc = "il delete va nella cliptboard di sistema" })
vim.keymap.set({"n","x"}, "Ød", [["+D]], { desc = "il Delete va nella cliptboard di sistema" })
vim.keymap.set({"n","x"}, "<leader>d", [["_d]], { desc = "il delete non va nella clipboard di nvim" })
vim.keymap.set({"n","x"}, "<leader>D", [["_D]], { desc = "Delete dal cursore in poi senza andare nella clipboard di nvim" })

--change
vim.keymap.set({"n","x"}, "<leader>c", [["_c]], { desc = "change non va nella clipboard di nvim" })
vim.keymap.set({"n","x"}, "<leader>C", [["_C]], { desc = "Change dal cursore in poi senza andare nella clipboard di nvim" })
vim.keymap.set({"n","x"}, "Øc", [["+c]], { desc = "il change va nella cliptboard di sistema" })
vim.keymap.set({"n","x"}, "ØC", [["+C]], { desc = "il Change va nella cliptboard di sistema" })



-- highlight
vim.keymap.set({"n","x"}, "Øn", "gN", { desc = "find the prev match with the last used search pattern and Visually select it" })
vim.keymap.set({"n","x"}, "Øv", "gv")

vim.keymap.set({"n","x"}, "Øp", function()
  -- Get the position of the start and end marks of the last operation
	local start_mark = vim.fn.getpos("'[")
	local end_mark = vim.fn.getpos("']")

  -- Check if the marks are valid/unset (row is 0) or if no operation happened
	if start_mark[2] == 0 or end_mark[2] == 0 then return end
	-- Get the type of the last changed/pasted text
	-- 'v' = character-wise, 'V' = line-wise, '<C-v>' = block-wise
	local reg_unnamed = vim.fn.getregtype('"')
	-- Get the type of the last changed/pasted text
	local reg_system= vim.fn.getregtype('+')
  local regtype = (reg_system == "V" or reg_system:sub(1, 1) == "\22") and reg_system or reg_unnamed
	-- Fallback to character-wise if type is unknown
	local visual_mode = "v"

	if regtype == "V" then
		visual_mode = "V"
	elseif regtype:sub(1, 1) == "\22" then -- \22 is the escape sequence for <C-v>
		visual_mode = "\22"
	end

	-- Move to the start mark, enter the correct visual mode, and move to the end mark
	vim.cmd("normal! `[" .. visual_mode .. "`]")
end, { desc = "Select last pasted text with correct visual mode" })


--DOTO 
-- | | text-objects 
-- gestire lo switch dei worktree
