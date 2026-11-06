return {
{ 'stevearc/quicker.nvim',
  ft = "qf",
  opts = {},
  config=function ()
  require("quicker").setup({
    -- Local options to set for quickfix
    opts = {
      buflisted = true,
      number = true,
      relativenumber = true,
      signcolumn = "auto",
      winfixheight = true,
      wrap = true,
    },
    -- Set to false to disable the default options in `opts`
    use_default_opts = true,
    -- Keymaps to set for the quickfix buffer
    keys = {
        -- { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context", },
        { "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context", },
        { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
    },
  -- Callback function to run any custom logic or keymaps for the quickfix buffer
  on_qf = function(bufnr) end,
  edit = {
    -- Enable editing the quickfix like a normal buffer
    enabled = true,
    -- Set to true to write buffers after applying edits.
    -- Set to "unmodified" to only write unmodified buffers.
    autosave = "true",
  },
  -- Keep the cursor to the right of the filename and lnum columns
  constrain_cursor = true,
  highlight = {
    -- Use treesitter highlighting
    treesitter = true,
    -- Use LSP semantic token highlighting
    lsp = true,
    -- Load the referenced buffers to apply more accurate highlights (may be slow)
    load_buffers = true,
  },
  follow = {
    -- When quickfix window is open, scroll to closest item to the cursor
    enabled = false,
  },
  -- Map of quickfix item type to icon
  type_icons = {
    E = "E ",
    W = "W ",
    I = "I ",
    N = "N ",
    H = "H ",
  },
  -- Border characters
  borders = {
    vert = "┃",
    -- Strong headers separate results from different files
    strong_header = "━",
    strong_cross = "╋",
    strong_end = "┫",
    -- Soft headers separate results within the same file
    soft_header = "╌",
    soft_cross = "╂",
    soft_end = "┨",
  },
  -- How to trim the leading whitespace from results. Can be 'all', 'common', or false
  trim_leading_whitespace = "common",
  -- Maximum width of the filename column
  max_filename_width = function()
    return math.floor(math.min(95, vim.o.columns / 2))
  end,
  -- How far the header should extend to the right
  header_length = function(type, start_col)
    return vim.o.columns - start_col
  end
	})
  end },
-- { 'ten3roberts/qf.nvim',
--     config = function()
--       require'qf'.setup({
--  -- Location list configuration
--     l = {
--         auto_close = true, -- Automatically close location/quickfix list if empty
--         auto_follow = 'prev', -- Follow current entry, possible values: prev,next,nearest, or false to disable
--         auto_follow_limit = 100, -- Do not follow if entry is further away than x lines
--         follow_slow = true, -- Only follow on CursorHold
--         auto_open = true, -- Automatically open list on QuickFixCmdPost
--         auto_resize = true, -- Auto resize and shrink location list if less than `max_height`
--         max_height = 10, -- Maximum height of location/quickfix list
--         min_height = 3, -- Minimum height of location/quickfix list
--         wide = true, -- Open list at the very bottom of the screen, stretching the whole width.
--         number = true, -- Show line numbers in list
--         relativenumber = true, -- Show relative line numbers in list
--         unfocus_close = false, -- Close list when window loses focus
--         focus_open = false, -- Auto open list on window focus if it contains items
--     },
--     -- Quickfix list configuration
--     c = {
--         auto_close = true, -- Automatically close location/quickfix list if empty
--         auto_follow = 'prev', -- Follow current entry, possible values: prev,next,nearest, or false to disable
--         auto_follow_limit = 100, -- Do not follow if entry is further away than x lines
--         follow_slow = true, -- Only follow on CursorHold
--         auto_open = true, -- Automatically open list on QuickFixCmdPost
--         auto_resize = true, -- Auto resize and shrink location list if less than `max_height`
--         max_height = 10, -- Maximum height of location/quickfix list
--         min_height = 3, -- Minimum height of location/quickfix list
--         wide = true, -- Open list at the very bottom of the screen, stretching the whole width.
--         number = true, -- Show line numbers in list
--         relativenumber = true, -- Show relative line numbers in list
--         unfocus_close = false, -- Close list when window loses focus
--         focus_open = false, -- Auto open list on window focus if it contains items
--       },
--       close_other = false, -- Close location list when quickfix list opens
--       pretty = true, -- Pretty print quickfix lists
--       silent = false, -- Suppress messages like "(1 of 3): *line content*" on jump
--       })
--   end }
}
