return {
    {'echasnovski/mini.splitjoin', version = '*',  config = function() require('mini.splitjoin').setup({ mappings = { toggle = 'sj', split = '', join = '', }, detect = { brackets = nil, separator = ',', exclude_regions = nil, }, split = { hooks_pre = {}, hooks_post = {}, }, join = { hooks_pre = {}, hooks_post = {}, }, }) end },
    {'echasnovski/mini.pairs', versione = '*', config = function() require('mini.pairs').setup({ modes = { insert = true, command = false, terminal = false }, mappings = { ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' }, ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' }, ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' }, [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' }, [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' }, ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' }, }, }) end},
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup({
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
                    add = 'sa',        -- Add surrounding in Visual modes
                    delete = 'sd',     -- Delete surrounding
                    find = 'sf',      -- Find surrounding (to the right)
                    find_left = 'sl', -- Find surrounding (to the left)
                    replace = 'sr',    -- Replace surrounding
                    suffix_last = 'l', -- Suffix to search with "prev" method
                    suffix_next = 'n', -- Suffix to search with "next" method
                },
                -- Number of lines within which surrounding is searched
                n_lines = 20,
                -- Whether to respect selection type:
                -- - Place surroundings on separate lines in linewise mode.
                -- - Place surroundings on each line in blockwise mode.
                respect_selection_type = false,
                search_method = 'cover',
                -- Whether to disable showing non-error feedback
                silent = false,
            })
        end
    }
}
