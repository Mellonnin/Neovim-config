return {
    'smoka7/hop.nvim',
    version = "*",
    config = function()
        require("hop").setup({
            keys = "fjdksla;qpwoeirutcmvn{}[]()%_-+'!",
        })
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        local position = require("hop.hint").HintPosition

        -- s/w/g/v/l/k/c + n/p/a/i
        --o (end word)
        --r (start word)
        --t (pattern)
        --v (vertical line)
        --l (line start)
        --k (char2)
        --c (char1)
        --i (inline)
        --a (after cursor)
        --p (before cursor)
        --e (anywhere)
        --CHAR1 SECTION 4
        -- char1
        vim.keymap.set({ "n", "v" }, "<leader>ce", function()
            hop.hint_char1()
        end, { desc = "hop char1 anywhere" })

        -- char1 after cursor
        vim.keymap.set({ "n", "v" }, "<leader>cn", function()
            hop.hint_char1({
                direction = directions.AFTER_CURSOR,
                current_line_only = false
            })
        end, { desc = "hop char1 after cursor" })

        -- char1 before cursor
        vim.keymap.set({ "n", "v" }, "<leader>cp", function()
            hop.hint_char1({
                direction = directions.BEFORE_CURSOR,
                current_line_only = false
            })
        end, { desc = "hop char1 before cursor" })

        -- char1 cursor inline
        vim.keymap.set({ "n", "v" }, "<leader>ci", function()
            hop.hint_char1({ current_line_only = true })
        end, { desc = "hop char1 cursor inline" })



        --CHAR2 SECTION 4
        -- char2
        vim.keymap.set({ "n", "v" }, "<leader>ke", function()
            hop.hint_char2()
        end, { desc = "hop char2 anywhere" })

        -- char2 after cursor
        vim.keymap.set({ "n", "v" }, "<leader>kn", function()
            hop.hint_char2({
                direction = directions.AFTER_CURSOR,
                current_line_only = false
            })
        end, { desc = "hop char2 after cursor" })

        -- char2 before cursor
        vim.keymap.set({ "n", "v" }, "<leader>kp", function()
            hop.hint_char2({
                direction = directions.BEFORE_CURSOR,
                current_line_only = false
            })
        end, { desc = "hop char2 before cursor" })

        -- char2 cursor inline
        vim.keymap.set({ "n", "v" }, "<leader>ki", function()
            hop.hint_char2({ current_line_only = true })
        end, { desc = "hop char2 cursor inline" })


        --LINE SECTION 2
        --vertical line
        vim.keymap.set({"n", "v" }, "<leader>v", function()
            hop.hint_vertical()
        end, { desc = "hop vertical" })

        --start line
        vim.keymap.set({ "n", "v" }, "<leader>l", function()
            hop.hint_lines_skip_whitespace()
        end, { desc = "hop line start" })

        --PATTERN SECTION 1
        -- pattern
        vim.keymap.set({ "n", "v" }, "<leader>te", function()
            hop.hint_patterns()
        end, { desc = "hop pattern" })




        --WORD SECTION 8

        -- START WORD SECTION
        -- start word
        vim.keymap.set({ "n", "v" }, "<leader>re", function()
            hop.hint_words()
        end, { desc = "hop start word anywhere" })
        -- start word after cursor
        vim.keymap.set({ "n", "v" }, "<leader>rn", function()
            hop.hint_words({ direction = directions.AFTER_CURSOR })
        end, { desc = "hop start word after cursor" })

        -- start word before cursor
        vim.keymap.set({ "n", "v" }, "<leader>rp", function()
            hop.hint_words({ direction = directions.BEFORE_CURSOR })
        end, { desc = "hop start word before cursor" })

        -- start word inline
        vim.keymap.set({ "n", "v" }, "<leader>ri", function()
            hop.hint_words({ current_line_only = true })
        end, { desc = "hop start word inline" })



        --END WORD
        -- end word
        vim.keymap.set({ "n", "v" }, "<leader>oe", function()
            hop.hint_words({ hint_position = position.END })
        end, { desc = "hop end word anywhere" })

        -- end word after cursor
        vim.keymap.set({ "n", "v" }, "<leader>on", function()
            hop.hint_words({
                direction = directions.AFTER_CURSOR,
                hint_position = position.END,
            })
        end, { desc = "hop end word after cursor" })

        -- end word before cursor
        vim.keymap.set({ "n", "v" }, "<leader>op", function()
            hop.hint_words({
                direction = directions.BEFORE_CURSOR,
                hint_position = position.END,
            })
        end, { desc = "hop end word before cursor" })

        -- end word inline
        vim.keymap.set({ "n", "v" }, "<leader>oi", function()
            hop.hint_words({
                hint_position = position.END,
                current_line_only = true
            })
        end, { desc = "hop end word inline" })
    end
}
