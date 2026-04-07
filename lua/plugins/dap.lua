return {
  {
    "MironPascalCaseFan/debugmaster.nvim",
     -- osv is needed if you want to debug neovim lua code. Also can be used 
     -- as a way to quickly test-drive the plugin without configuring debug adapters 
    dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind", },
    config = function()
      local dm = require("debugmaster")
      vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- vim.keymap.set("n", "<leader><leader>d",dm.mode.enable)
      vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      local dap = require("dap")
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    end
  }
}
