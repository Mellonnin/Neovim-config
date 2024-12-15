return {
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                auto_install = true,
                ensure_installed = { "typescript", "javascript" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    { "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
            -- ensure ; goes forward and , goes backward regardless of the last direction
            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
            vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
            require "nvim-treesitter.configs".setup({
                textobjects = {
                    select = {
                        enable = true,
                        include_surrounding_whitespace = true,
                        lookahead = true,
                        keymaps = {["af"] = "@function.outer", ["if"] = "@function.inner", ["as"] = "@class.outer", ["is"] = "@class.inner", ["ac"] = "@conditional.outer", ["ic"] = "@conditional.inner", ["al"] = "@loop.outer", ["il"] = "@loop.inner", ["ap"] = "@parameter.outer", ["ip"] = "@parameter.inner",},
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {["]af"] = "@function.outer", ["]if"] = "@function.inner", ["]as"] = "@class.outer", ["]is"] = "@class.inner", ["]ac"] = "@conditional.outer", ["]ic"] = "@conditional.inner", ["]al"] = "@loop.outer", ["]il"] = "@loop.inner", ["]ap"] = "@parameter.outer", ["]ip"] = "@parameter.inner",},
                        goto_next_end = {["]fa"] = "@function.outer", ["]fi"] = "@function.inner", ["]sa"] = "@class.outer", ["]si"] = "@class.inner", ["]ca"] = "@conditional.outer", ["]ci"] = "@conditional.inner", ["]la"] = "@loop.outer", ["]li"] = "@loop.inner", ["]pa"] = "@parameter.outer", ["]pi"] = "@parameter.inner",},
                        goto_previous_start = {["[af"] = "@function.outer", ["[if"] = "@function.inner", ["[as"] = "@class.outer", ["[is"] = "@class.inner", ["[ac"] = "@conditional.outer", ["[ic"] = "@conditional.inner", ["[al"] = "@loop.outer", ["[il"] = "@loop.inner", ["[ap"] = "@parameter.outer", ["[ip"] = "@parameter.inner",},
                        goto_previous_end = {["[fa"] = "@function.outer", ["[fi"] = "@function.inner", ["[sa"] = "@class.outer", ["[si"] = "@clasj.inner", ["[ca"] = "@conditional.outer", ["[ci"] = "@conditional.inner", ["[la"] = "@loop.outer", ["[li"] = "@loop.inner", ["[pa"] = "@parameter.outer", ["[pi"] = "@parameter.inner",},
                        goto_next = {["'af"] = "@function.outer", ["'if"] = "@function.inner", ["'as"] = "@clajs.outer", ["'is"] = "@class.inner", ["'ac"] = "@conditional.outer", ["'ic"] = "@conditional.inner", ["'al"] = "@loop.outer", ["'il"] = "@loop.inner", ["'ap"] = "@parameter.outer", ["'ip"] = "@parameter.inner",},
                        goto_previous = {
                            ["'fa"] = "@function.outer", ["'fi"] = "@function.inner",
                            ["'sa"] = "@class.outer", ["'si"] = "@class.inner",
                            ["'ca"] = "@conditional.outer", ["'ci"] = "@conditional.inner",
                            ["'la"] = "@loop.outer", ["'li"] = "@loop.inner",
                            ["'pa"] = "@parameter.outer", ["'pi"] = "@parameter.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {["<leader>m"] = "@parameter.inner",},
                        swap_previous = {["<leader>M"] = "@parameter.inner",},
                    },
                },
            })
        end
    }
}
