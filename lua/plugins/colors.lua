return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup()
            vim.cmd.colorscheme 'catppuccin-mocha'
        end
    },
    --{"rebelot/kanagawa.nvim", config = function ( ) require('kanagawa').setup({vim.cmd.colorscheme "kanagawa-dragon"}); end}
}
