return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {"<leader>tt","<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics",},
            {"<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics",},
            {"<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)",},
            {"<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... ",},
            {"<leader>tl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List",},
            {"<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List",},
        },
    }
}
