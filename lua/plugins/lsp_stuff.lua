return {
  -- {'nanotee/sqls.nvim',config = function() require("sqls").setup() end},
  { 'nvim-java/nvim-java', -- da togliere
    config = function()
      require('java').setup()
      vim.lsp.enable('jdtls')
    end },
  { "neovim/nvim-lspconfig" },
  { "rachartier/tiny-code-action.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "LspAttach",
    opts = {}, },
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "hrsh7th/nvim-cmp", -- da togliere
    dependencies = { "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({

          ["<C-z>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<S-tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.select_prev_item(),

          -- commands in completion mode (see |popupmenu-keys|)
          -- |complete_CTRL-E| CTRL-E	stop completion and go back to original text
          -- |complete_CTRL-Y| CTRL-Y	accept selected match and stop completion
          -- 		CTRL-L		insert one character from the current match
          -- 		<CR>		insert currently selected match
          -- 		<BS>		delete one character and redo search
          -- 		CTRL-H		same as <BS>
          -- 		<Up>		select the previous match
          -- 		<Down>		select the next match
          -- 		<PageUp>	select a match several entries back
          -- 		<PageDown>	select a match several entries forward
          -- 		other		stop completion and insert the typed character


        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "buffer" } })
      })
    end },
}
