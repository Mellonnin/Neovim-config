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
                    find = 'sfr',      -- Find surrounding (to the right)
                    find_left = 'sfl', -- Find surrounding (to the left)
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
                silent = true,
            })
        end
    },
    {
        'echasnovski/mini.move',
        version = '*',
        config = function()
            require('mini.move').setup({
                mappings = {
                    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                    left = '<M-h>',
                    right = '<M-l>',
                    down = '',
                    up = '',

                    -- Move current line in Normal mode
                    line_left = '<M-h>',
                    line_right = '<M-l>',
                    line_down = '<M-j>',
                    line_up = '<M-k>',
                },

                options = {
                    -- Automatically reindent selection during linewise vertical move
                    reindent_linewise = true,
                },
            })
        end
    },
}
