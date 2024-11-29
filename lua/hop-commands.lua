--h + s/w/g/v/l/k/c + n/p/a/i
--s (end word)
--w (start word)
--g (pattern)
--v (vertical line)
--l (line start)
--k (char2)
--c (char1)
--i (inline)
--n (after cursor)
--p (before cursor)
--CHAR1 SECTION 4
-- char1
vim.keymap.set({ "n", "o", "x" }, "<leader>hca", function()
require 'hop'.hint_char1() end, { desc = "hop char1 anywhere" })

-- char1 after cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hcn", function() require 'hop'.hint_char1({
    direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
    current_line_only = false
}) end, { desc = "hop char1 after cursor" })

-- char1 before cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hcb", function() require 'hop'.hint_char1({
    direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR,
    current_line_only = false
}) end,{ desc = "hop char1 before cursor" })

-- char1 cursor inline
vim.keymap.set({ "n", "o", "x" }, "<leader>hci", function()
    require 'hop'.hint_char1({ current_line_only = true })
end,{ desc = "hop char1 cursor inline" })



--CHAR2 SECTION 4
-- char2
vim.keymap.set({ "n", "o", "x" }, "<leader>hka", function()
require 'hop'.hint_char2() end, { desc = "hop char2 anywhere" })

-- char2 after cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hkn", function() require 'hop'.hint_char2({
    direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
    current_line_only = false
}) end, { desc = "hop char2 after cursor" })

-- char2 before cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hkb", function() require 'hop'.hint_char2({
    direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR,
    current_line_only = false
}) end,{ desc = "hop char2 before cursor" })

-- char2 cursor inline
vim.keymap.set({ "n", "o", "x" }, "<leader>hki", function()
    require 'hop'.hint_char2({ current_line_only = true })
end,{ desc = "hop char2 cursor inline" })


--LINE SECTION 2
--vertical line
vim.keymap.set({ "n", "o", "x" }, "<leader>hv", function()
require 'hop'.hint_vertical() end, { desc = "hop vertical" })

--start line
vim.keymap.set({ "n", "o", "x" }, "<leader>hl", function()
require 'hop'.hint_lines_skip_whitespace() end, { desc = "hop line start" })



--PATTERN SECTION 3
-- pattern
vim.keymap.set({ "n", "o", "x" }, "<leader>hga", function()
require 'hop'.hint_patters() end, { desc="hop pattern" })

-- pattern after cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hgn", function()
    require 'hop'.hint_patters({ direction = require 'hop.hint'.HintDirection.after_cursor })
end, { desc="hop pattern after cursor" })

-- pattern before cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hgp", function()
    require 'hop'.hint_patters({ direction = require 'hop.hint'.HintDirection.before_cursor })
end, { desc="hop pattern before cursor" })



--WORD SECTION 8

-- STAR WORD SECTION
-- start word
vim.keymap.set({ "n", "o", "x" }, "<leader>hwa", function()
require 'hop'.hint_words() end, { desc="hop start word anywhere" })
-- start word after cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hwn", function()
    require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.AFTER_CURSOR })
end, { desc="hop start word after cursor" })

-- start word before cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hwp", function()
    require 'hop'.hint_words({ direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR })
end, { desc="hop start word before cursor" })

-- start word inline
vim.keymap.set({ "n", "o", "x" }, "<leader>hiw", function()
    require 'hop'.hint_words({ current_line_only = true })
end, { desc="hop start word inline" })



--END WORD
-- end word
vim.keymap.set({ "n", "o", "x" }, "<leader>hsa", function()
    require 'hop'.hint_words({ hint_position = require 'hop.hint'.HintPosition.END })
end, { desc="hop end word anywhere" })

-- end word after cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hsn", function() require 'hop'.hint_words({
    direction = require 'hop.hint'.HintDirection.after_cursor,
    hint_position = require 'hop.hint'.HintPosition.END,
}) end, { desc="hop end word after cursor" })

-- end word before cursor
vim.keymap.set({ "n", "o", "x" }, "<leader>hsp", function() require 'hop'.hint_words({
    direction = require 'hop.hint'.HintDirection.before_cursor,
    hint_position = require 'hop.hint'.HintPosition.END,
}) end, { desc="hop end word before cursor" })

-- end word inline
vim.keymap.set({ "n", "o", "x" }, "<leader>hsi", function() require 'hop'.hint_words({
    hint_position = require 'hop.hint'.HintPosition.END,
    current_line_only = true
}) end, { desc="hop end word inline" })

