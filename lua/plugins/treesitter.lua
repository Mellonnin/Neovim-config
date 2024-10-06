return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                auto_install = true,
                ensure_installed = {
                    "typescript", "javascript"
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "nvim-treesitter.configs".setup({
                textobjects = {
                    select = {
                        enable = true,
                        include_surrounding_whitespace = true,
                        lookahead = true,
                        keymaps = {
                            ["of"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["os"] = "@class.outer",
                            ["is"] = "@class.inner",
                            ["oc"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",
                            ["ol"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["op"] = "@parameter.outer",
                            ["ip"] = "@parameter.inner",
                        },
                    }
                },
                {
                    goto_next_start = {
                        ["]of"] = "@function.outer",
                        ["]if"] = "@function.inner",
                        ["]os"] = "@class.outer",
                        ["]is"] = "@class.inner",
                        ["]oc"] = "@conditional.outer",
                        ["]ic"] = "@conditional.inner",
                        ["]ol"] = "@loop.outer",
                        ["]il"] = "@loop.inner",
                        ["]op"] = "@parameter.outer",
                        ["]ip"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]fo"] = "@function.outer",
                        ["]fi"] = "@function.inner",
                        ["]so"] = "@class.outer",
                        ["]si"] = "@class.inner",
                        ["]co"] = "@conditional.outer",
                        ["]ci"] = "@conditional.inner",
                        ["]lo"] = "@loop.outer",
                        ["]li"] = "@loop.inner",
                        ["]po"] = "@parameter.outer",
                        ["]pi"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[of"] = "@function.outer",
                        ["[if"] = "@function.inner",
                        ["[os"] = "@class.outer",
                        ["[is"] = "@class.inner",
                        ["[oc"] = "@conditional.outer",
                        ["[ic"] = "@conditional.inner",
                        ["[ol"] = "@loop.outer",
                        ["[il"] = "@loop.inner",
                        ["[op"] = "@parameter.outer",
                        ["[ip"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[fo"] = "@function.outer",
                        ["[fi"] = "@function.inner",
                        ["[so"] = "@class.outer",
                        ["[si"] = "@clasj.inner",
                        ["[ci"] = "@conditional.outer",
                        ["[co"] = "@conditional.inner",
                        ["[lo"] = "@loop.outer",
                        ["[li"] = "@loop.inner",
                        ["[po"] = "@parameter.outer",
                        ["[pi"] = "@parameter.inner",
                    },
                    goto_next = {
                        ["'of"] = "@function.outer",
                        ["'if"] = "@function.inner",
                        ["'os"] = "@clajs.outer",
                        ["'is"] = "@class.inner",
                        ["'oc"] = "@conditional.outer",
                        ["'ic"] = "@conditional.inner",
                        ["'ol"] = "@loop.outer",
                        ["'il"] = "@loop.inner",
                        ["'op"] = "@parameter.outer",
                        ["'ip"] = "@parameter.inner",
                    },
                    goto_previous = {
                        ["'fo"] = "@function.outer",
                        ["'fi"] = "@function.inner",
                        ["'so"] = "@class.outer",
                        ["'si"] = "@class.inner",
                        ["'co"] = "@conditional.outer",
                        ["'ci"] = "@conditional.inner",
                        ["'lo"] = "@loop.outer",
                        ["'li"] = "@loop.inner",
                        ["'po"] = "@parameter.outer",
                        ["'pi"] = "@parameter.inner",
                    },
                }
            })
        end
    }
}
