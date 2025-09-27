return {
   {"neovim/nvim-lspconfig"},
   {"mfussenegger/nvim-jdtls"},
   {
      "rachartier/tiny-code-action.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "LspAttach",
      opts = {},
   },
   {
      "williamboman/mason.nvim",
      config = function() require("mason").setup() end
   },
   {
      "michaelb/sniprun",
      branch = "master",

      build = "sh install.sh",
      -- do 'sh install.sh 1' if you want to force compile locally
      -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

      config = function()
         require("sniprun").setup({
            -- your options
         })
      end,
   },
}
--     -- { "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" } },
--     -- {
--     --     "hrsh7th/nvim-cmp",
--     --     dependencies = { "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", },
--     --     config = function()
--     --         local cmp = require("cmp")
--     --         require("luasnip.loaders.from_vscode").lazy_load()
--     --         cmp.setup({
--     --             snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end, },
--     --             window = {
--     --                 completion = cmp.config.window.bordered(),
--     --                 documentation = cmp.config.window.bordered(),
--     --             },
--     --             mapping = cmp.mapping.preset.insert({
--     --                 ["<C-z>"] = cmp.mapping.close(),
--     --                 ["<CR>"] = cmp.mapping.confirm({ select = false }),
--     --                 ["<tab>"] = cmp.mapping.confirm({ select = true }),
--     --                 ["<n>"] = cmp.mapping.select_next_item(),
--     --                 ["<m>"] = cmp.mapping.select_prev_item(),
--     --
--     --
--     --                 -- commands in completion mode (see |popupmenu-keys|)
--     --                 -- |complete_CTRL-E| CTRL-E	stop completion and go back to original text
--     --                 -- |complete_CTRL-Y| CTRL-Y	accept selected match and stop completion
--     --                 -- 		CTRL-L		insert one character from the current match
--     --                 -- 		<CR>		insert currently selected match
--     --                 -- 		<BS>		delete one character and redo search
--     --                 -- 		CTRL-H		same as <BS>
--     --                 -- 		<Up>		select the previous match
--     --                 -- 		<Down>		select the next match
--     --                 -- 		<PageUp>	select a match several entries back
--     --                 -- 		<PageDown>	select a match several entries forward
--     --                 -- 		other		stop completion and insert the typed character
--     --
--     --
--     --             }),
--     --             sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } })
--     --         })
--     --     end
--     -- },
--     -- {
--     --     "nvimtools/none-ls.nvim",
--     --     config = function()
--     --         local null_ls = require("null-ls")
--     --         null_ls.setup({ sources = { null_ls.builtins.formatting.clang_format, }, })
--     --     end
--     -- },
--
