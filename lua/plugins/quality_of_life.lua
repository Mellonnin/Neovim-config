return {
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup({
                -- Add custom surroundings to be used on top of builtin ones. For more
                -- information with examples, see `:h MiniSurround.config`.
                custom_surroundings = {
                    [')'] = { output = { left = '( ', right = ' )' } },
                    ['('] = { output = { left = '( ', right = ' )' } },
                    [']'] = { output = { left = '[ ', right = ' ]' } },
                    ['['] = { output = { left = '[ ', right = ' ]' } },
                    ['}'] = { output = { left = '{ ', right = ' }' } },
                    ['{'] = { output = { left = '{ ', right = ' }' } },
                    ['>'] = { output = { left = '< ', right = ' >' } },
                    ['<'] = { output = { left = '< ', right = ' >' } },
                },
                mappings = {
                    add = 'sa',        -- Add surrounding in Visual modes
                    delete = 'sd',     -- Delete surrounding
                    find = 'sfr',      -- Find surrounding (to the right)
                    find_left = 'sfl', -- Find surrounding (to the left)
                    replace = 'sr',    -- Replace surrounding
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
        'echasnovski/mini.splitjoin',
        version = '*',
        config = function()
            require('mini.splitjoin').setup({
                mappings = {
                    toggle = 'sj',
                    split = '',
                    join = '',
                },
                detect = {
                    brackets = nil,
                    separator = ',',
                    exclude_regions = nil,
                },
                split = {
                    hooks_pre = {},
                    hooks_post = {},
                },
                join = { hooks_pre = {}, hooks_post = {}, },
            })
        end
    },
    {
        'echasnovski/mini.pairs',
        versione = '*',
        config = function()
            require('mini.pairs').setup({
                modes = { insert = true, command = false, terminal = false },
                mappings = {
                    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
                    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
                    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
                    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },

                    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
                    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },

                    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].' },
                    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\]' },
                    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].' },
                },
            })
        end
    },
}
