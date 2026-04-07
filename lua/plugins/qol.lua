return {
  {"tversteeg/registers.nvim",
    cmd = "Registers",
    keys = {
			{ "\"",     mode = { "n", "v" } },
			{ "<c-\'>", mode = "i" }
		},
		name = "registers",
		config = function()
			local registers = require("registers")
			registers.setup({
				show_empty = false,      -- Show a line at the bottom with registers that aren't filled
				system_clipboard = false, -- Always transfer all selected registers to the system clipboard
				show_register_types = true, -- Show a character next to the register name indicating how the register will be applied
				bind_keys = {
					["<CR>"]  = registers.apply_register(), -- Immediately apply the selected register line when pressing the return key
					["<Esc>"] = registers.close_window(), -- Close the registers window when pressing the Esc key
					["<C-j>"] = registers.move_cursor_down(), -- Move the cursor in the registers window down when pressing <C-j>
					["<C-k>"] = registers.move_cursor_up(), -- Move the cursor in the registers window up when pressing <C-k>
					["<C-d>"] = registers.clear_highlighted_register(), -- Clear the register of the highlighted line when pressing <DeL>
				},
				symbols = {
					newline = "⏎", -- Show a special character for line breaks
					space = " ", -- Show space characters without changes
					tab = "·", -- Show a special character for tabs
					register_type_charwise = "ᶜ", -- The character to show when a register will be applied in a char-wise fashion
					register_type_linewise = "ˡ", -- The character to show when a register will be applied in a line-wise fashion
					register_type_blockwise = "ᵇ", -- The character to show when a register will be applied in a block-wise fashion
				},
				window = {
					max_width = 100, -- The window can't be wider than 100 characters
					highlight_cursorline = true, -- Show a small highlight in the sign column for the line the cursor is on
					border = "none", -- Don't draw a border around the registers window
					transparency = 10, -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
				},
			})
		end
	},
	{ "yaocccc/nvim-foldsign", event = "CursorHold", config = function() require("nvim-foldsign").setup({ offset = -2, foldsigns = { open = '-', close = '+', seps = { '│', '┃' } } }) end },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		defaults = {
			auto_close = true, -- auto close when there are no items
			auto_open = true, -- auto open when there are items
			auto_preview = true, -- automatically open preview when on an item
			auto_refresh = true, -- auto refresh when open
			auto_jump = true, -- auto jump to the item when there's only one
			focus = false, -- Focus the window when opened
			restore = true, -- restores the last location in the list when opening
			follow = true, -- Follow the current item
			indent_guides = true, -- show indent guides
			max_items = 200, -- limit number of items that can be displayed per section
			multiline = true, -- render multi-line messages
			pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
			warn_no_results = true, -- show a warning when there are no results
			open_no_results = false, -- open the trouble window when there are no results
		},
		keys = {
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tb",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tr",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	}
}
