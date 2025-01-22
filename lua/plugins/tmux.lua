return {
    { "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    },
    { 'karshPrime/tmux-compile.nvim', event = 'VeryLazy' },
    {
        "juselara1/tmutils.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("tmutils").setup({})
        end,
    }
}
