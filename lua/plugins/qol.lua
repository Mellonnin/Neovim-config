return {
    {'smoka7/hop.nvim', version = "*", opts = { keys = 'fjdksla;ghcmtuvnrixeozq[wzybp' }, config = function() require("hop").setup({}) end},
    {"yaocccc/nvim-foldsign", event = 'CursorHold', config = function() require('nvim-foldsign').setup({ offset = -2, foldsigns = { open = '-', close = '+', seps = { '│', '┃' }, } }) end},
    {"rachartier/tiny-inline-diagnostic.nvim", event = "VeryLazy", priority = 1000, config = function() require('tiny-inline-diagnostic').setup() end},
    {
        "tversteeg/registers.nvim",
        cmd = "Registers",
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-R>", mode = "i" }
        },
        name = "registers",
        config = function()
            local registers = require("registers")
            registers.setup({
                -- Show a line at the bottom with registers that aren't filled
                show_empty = false,
                -- Always transfer all selected registers to the system clipboard
                system_clipboard = false,
                -- Show a character next to the register name indicating how the register will be applied
                show_register_types = true,
                bind_keys = {
                    -- Immediately apply the selected register line when pressing the return key
                    ["<CR>"]  = registers.apply_register(),
                    -- Close the registers window when pressing the Esc key
                    ["<Esc>"] = registers.close_window(),
                    -- Move the cursor in the registers window down when pressing <C-j>
                    ["<C-j>"] = registers.move_cursor_down(),
                    -- Move the cursor in the registers window up when pressing <C-k>
                    ["<C-k>"] = registers.move_cursor_up(),
                    -- Clear the register of the highlighted line when pressing <DeL>
                    ["<C-d>"] = registers.clear_highlighted_register(),
                },
                symbols = {
                    -- Show a special character for line breaks
                    newline = "⏎",
                    -- Show space characters without changes
                    space = " ",
                    -- Show a special character for tabs
                    tab = "·",
                    -- The character to show when a register will be applied in a char-wise fashion
                    register_type_charwise = "ᶜ",
                    -- The character to show when a register will be applied in a line-wise fashion
                    register_type_linewise = "ˡ",
                    -- The character to show when a register will be applied in a block-wise fashion
                    register_type_blockwise = "ᵇ",
                },
                window = {
                    -- The window can't be wider than 100 characters
                    max_width = 100,
                    -- Show a small highlight in the sign column for the line the cursor is on
                    highlight_cursorline = true,
                    -- Don't draw a border around the registers window
                    border = "none",
                    -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
                    transparency = 10,
                },
            })
        end
    }

}
