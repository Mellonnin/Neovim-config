return {
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
         style = "night",
      },
      config = function()
         require("tokyonight").setup({
         vim.cmd[[colorscheme tokyonight]]
         })
      end
   }


}
