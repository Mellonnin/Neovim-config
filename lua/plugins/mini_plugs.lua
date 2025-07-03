return {
    {
        "echasnovski/mini.jump",
        version = "*",
        config = function()
            require("mini.jump").setup({
                delay = { highlight = 10000000, idle_stop = 10000000, },
                silent = true,
            })
        end,
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        config = function()
            require("mini.surround").setup({
                custom_surroundings = {
                    [')'] = { output = { left = '(', right = ')' } },
                    ['('] = { output = { left = '(', right = ')' } },
                    [']'] = { output = { left = '[', right = ']' } },
                    ['['] = { output = { left = '[', right = ']' } },
                    ['}'] = { output = { left = '{', right = '}' } },
                    ['{'] = { output = { left = '{', right = '}' } },
                    ['>'] = { output = { left = '<', right = '>' } },
                    ['<'] = { output = { left = '<', right = '>' } },
                    ['"'] = { output = { left = '"', right = '"' } },
                    ["'"] = { output = { left = "'", right = "'" } },
                },
                mappings = {
                    add = '<leader>sa',     -- Add surrounding in Visual modes
                    delete = '<leader>sd',  -- Delete surrounding
                    replace = '<leader>sr', -- Replace surrounding
                },
                n_lines = 100,
                respect_selection_type = false,
                search_method = 'cover',
                silent = true,
            })
        end
    },
    {
        "echasnovski/mini.splitjoin",
        version = "*",
        config = function()
            require("mini.splitjoin").setup({
                mappings = {
                    toggle = 'gs',
                    split = '',
                    join = '',
                },

                -- Detection options: where split/join should be done
                detect = {
                    -- Array of Lua patterns to detect region with arguments.
                    -- Default: { '%b()', '%b[]', '%b{}' }
                    brackets = nil,

                    -- String Lua pattern defining argument separator
                    separator = ',',

                    -- Array of Lua patterns for sub-regions to exclude separators from.
                    -- Enables correct detection in presence of nested brackets and quotes.
                    -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
                    exclude_regions = nil,
                },

                split = {hooks_pre = {}, hooks_post = {},},

                join = {hooks_pre = {}, hooks_post = {},},
            })
        end
    },
}
