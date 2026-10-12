return {
  {    "MironPascalCaseFan/debugmaster.nvim",
     -- as a way to quickly test-drive the plugin without configuring debug adapters 
    dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind", },
    config = function()
      local dm = require("debugmaster")
      vim.keymap.set("n", "<C-g>",dm.mode.toggle)
      vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

      -- Press H in debug mode to view available commands.
      -- Toggle the side panel with u.
      -- Toggle float mode with U if the side panel has too little space to display content.
      -- Set/toggle breakpoints with t and start debugging with c.
      -- Navigate through debug sessions using debug mode keymaps (o - step over, m - step into, q - step out, r- run to cursor).



      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code

      local dap = require("dap")
      dap.adapters["pwa-node"]={
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {"/home/Mellonnin/langs/js-debug/src/dapDebugServer.js", "${port}"},
        }
      }
      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end

  }
}
