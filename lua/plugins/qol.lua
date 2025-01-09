return {
    { "yaocccc/nvim-foldsign", event = "CursorHold", config = function() require("nvim-foldsign").setup({ offset = -2, foldsigns = { open = '-', close = '+', seps = { '│', '┃' } } }) end },
    {
        "tversteeg/registers.nvim",
        cmd = "Registers",
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-t>", mode = "i" }
        },
        name = "registers",
        config = function()
            local registers = require("registers")
            registers.setup({
                show_empty = false,                                     -- Show a line at the bottom with registers that aren't filled
                system_clipboard = false,                               -- Always transfer all selected registers to the system clipboard
                show_register_types = true,                             -- Show a character next to the register name indicating how the register will be applied
                bind_keys = {
                    ["<CR>"]  = registers.apply_register(),             -- Immediately apply the selected register line when pressing the return key
                    ["<Esc>"] = registers.close_window(),               -- Close the registers window when pressing the Esc key
                    ["<C-j>"] = registers.move_cursor_down(),           -- Move the cursor in the registers window down when pressing <C-j>
                    ["<C-k>"] = registers.move_cursor_up(),             -- Move the cursor in the registers window up when pressing <C-k>
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
                    max_width = 100,             -- The window can't be wider than 100 characters
                    highlight_cursorline = true, -- Show a small highlight in the sign column for the line the cursor is on
                    border = "none",             -- Don't draw a border around the registers window
                    transparency = 10,           -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
                },
            })
        end
    },
    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup(
                {
                    preserve_cursor_position = {
                        enabled = true,
                    },
                    textobj = {
                        enabled = true,
                    },
                    highlight = {
                        on_put = false,
                        on_yank = false,
                        timer = 0,
                    },
                }
            )

            vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
            vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
            vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
            vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
            vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
            vim.keymap.set("n", "]y", "<Plug>(YankyPreviousEntry)")
            vim.keymap.set("n", "[y", "<Plug>(YankyNextEntry)")
            vim.keymap.set({ "n", "v" }, "]p", function() require("yanky.textobj").last_put() end, {})
        end
    }
}
