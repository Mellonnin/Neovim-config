return {
  {"tpope/vim-fugitive"},
  { "rhysd/git-messenger.vim" },
  { "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']h', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']h', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[h', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[h', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>gsh', gitsigns.stage_hunk)
          map('n', '<leader>ghr', gitsigns.reset_hunk)

          map('v', '<leader>gsh', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)

          map('v', '<leader>ghr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)

          map('n', '<leader>gsf', gitsigns.stage_buffer)
          map('n', '<leader>grf', gitsigns.reset_buffer)
          map('n', '<leader>gph', gitsigns.preview_hunk)
          map('n', '<leader>gpi', gitsigns.preview_hunk_inline)

          map('n', '<leader>gbl', function() gitsigns.blame_line({ full = true }) end)

          map('n', '<leader>gbf', function() gitsigns.blame({ full = true }) end)

          map('n', '<leader>gsQ', function() gitsigns.setqflist('all') end)
          map('n', '<leader>gsq', gitsigns.setqflist)
          map('n', '<leader>gcb',gitsigns.change_base)
          map('n', '<leader>grb',gitsigns.reset_base)

          -- Toggles
          map('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>gtw', gitsigns.toggle_word_diff)
          map('n', '<leader>gtl', gitsigns.toggle_linehl)
          map('n', '<leader>gtc', gitsigns.show_commit)
          map('n', '<leader>gat', gitsigns.get_actions)

          -- Text object
          map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
        end
      }
    end },
  {
    'kokusenz/deltaview.nvim',
    config = function()
      require('deltaview').setup({
        -- Disable nerd font icons if uninstalled (defaults to true)
        use_nerdfonts = true,

        -- Show both previous and next filenames when navigating
        -- false: shows "[2/5] -> next.lua"
        -- true: shows "<- prev.lua [2/5] -> next.lua"
        show_verbose_nav = false,

        -- Configures the position of the quick select opened by DeltaMenu when under the fzf_threshold
        -- 'hsplit': horizontal split window
        -- 'center': centered floating window
        -- 'bottom': centered at the bottom, floating window
        quick_select_view = 'hsplit',

        -- Number of files threshold for switching to fzf
        -- When the number of modified files >= this value, use fzf instead of quickselect
        fzf_threshold = 0,

        -- If this setting is true, will show the delta style line numbers in the statuscolumn.
        line_numbers = false,

        -- 'fzf-lua' | 'telescope' | 'fzf' | nil - specify which picker to use
        -- . If nil, will go through the order and pick the first available. The order is fzf-lua -> telescope -> fzf -> deltaview quickselect
        fzf_picker = "telescope",

        -- Use dandavison/delta as the diff viewer if true, uses delta.lua if falsy
        use_legacy_delta = nil,

        -- Custom keybindings
        keyconfig = {
          -- Global keybind to toggle DeltaMenu
          dm_toggle_keybind = "<leader>dm",

          -- Global keybind to toggle DeltaView (and exit diff if open)
          dv_toggle_keybind = "<leader>dl",

          -- Global keybind to toggle Delta (and exit diff if open)
          d_toggle_keybind = "<leader>da",

          -- Navigate between hunks in a diff
          next_hunk = "<Tab>",
          prev_hunk = "<S-Tab>",

          -- Navigate between files (when opened from DeltaMenu)
          next_diff = "]f",
          prev_diff = "[f",

          -- Open help legend
          help_legend = "d?"
        }
      })
    end
  },
  {
    'isakbm/gitgraph.nvim',
    opts = {
      git_cmd = "git",
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          -- vim.notify('GitMessenger' .. commit.hash .. '^!')
          -- vim.cmd(':GitMessenger  ' .. commit.hash .. '^!')
          -- print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          -- vim.notify('GitMessenger ' .. from.hash .. '~1..' .. to.hash)
          -- vim.cmd(':GitMessenger ' .. from.hash .. '~1..' .. to.hash)
          -- print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = { { "<leader>gg", function() require('gitgraph').draw({}, { all = true, max_count = 5000 }) end, desc = "GitGraph - Draw", }, }
  },
  {
    'polarmutex/git-worktree.nvim',
    version = '^2',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      local Hooks = require("git-worktree.hooks")
      local config = require('git-worktree.config')
      local update_on_switch = Hooks.builtins.update_current_buffer_on_switch
      local worktree = require("git-worktree")

      Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
        vim.notify("Moved from " .. prev_path .. " to " .. path)
        update_on_switch(path, prev_path)
      end)

      Hooks.register(Hooks.type.DELETE, function()
        vim.cmd(config.update_on_change_command)
      end)

      vim.keymap.set("n", "<leader>gwc", function() worktree.create_worktree("69", "main", "origin") end, { desc = "create worktree" })
      vim.keymap.set("n", "<leader>gws", function() worktree.switch_worktree("69") end, { desc = "switch worktree" })
      vim.keymap.set("n", "<leader>gwd", function() worktree.delete_worktree("69", true) end, { desc = "delete worktree" })
    end
  }
}
