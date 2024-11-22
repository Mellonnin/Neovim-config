return {
    { "meznaric/key-analyzer.nvim", opts = {} },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = { keys = 'fjdksla;ghcmtuvnrixeozq[wzybp' },
        config= function()
            require("hop").setup({})
        end
    }
}
