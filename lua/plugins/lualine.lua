return {
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = {
            left = '|', right = '|'
          },
          section_separators = {
            left = '|', right = '|'
          },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = { statusline = 1000, tabline = 1000, winbar = 1000, }
        },
        sections = {
          lualine_a = {
            'buffers'
            --'mode'
          },
          lualine_b = {
            'branch',
          },
          lualine_c = {
            'diff',
            --'filename'
          },
          lualine_x = {
            --'encoding',
            --'fileformat',
            --"windows",
            --"tabs",
            'diagnostics'
          },
          lualine_y = {
            --'progress'
            --'filetype'
            "harpoon2"
          },
          lualine_z = {
            'location'
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end
  }
}
