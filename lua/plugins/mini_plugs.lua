return {
    {
        "echasnovski/mini.jump",
        version = "*",
        config = function()
            require("mini.jump").setup({ delay = { highlight = 10000000, idle_stop = 10000000, }, silent = true, })
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
}
