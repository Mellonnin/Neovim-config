return {
    {
        "echasnovski/mini.jump",
        version = "*",
        config = function() require("mini.jump").setup({
            delay = {
                highlight = 10000000,
                idle_stop = 10000000,
            },
        }) end
    },
    {"echasnovski/mini.splitjoin", version = "*", config = function() require("mini.splitjoin").setup({ mappings = { toggle = 'sj', split = '', join = '', }, detect = { brackets = nil, separator = ',', exclude_regions = nil, }, split = { hooks_pre = {}, hooks_post = {}, }, join = { hooks_pre = {}, hooks_post = {}, }, }) end },
    {"echasnovski/mini.surround",
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
                    add = 'sa',     -- Add surrounding in Visual modes
                    delete = 'sd',  -- Delete surrounding
                    replace = 'sr', -- Replace surrounding
                },
                n_lines = 100,      -- Number of lines within which surrounding is searched
                -- Whether to respect selection type:
                -- - Place surroundings on separate lines in linewise mode.
                -- - Place surroundings on each line in blockwise mode.
                respect_selection_type = false,
                search_method = 'cover',
                silent = false, -- Whether to disable showing non-error feedback
            })
        end
    }
}
