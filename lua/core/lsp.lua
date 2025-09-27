vim.lsp.enable({
   "jdtls",
   "lua_ls",
   "gopls",
   "sqls",
})


vim.diagnostic.config({
   -- virtual_lines = true,
   virtual_text = true,
   underline = true,
   update_in_insert = false,
   severity_sort = true,
   float = {
      border = "rounded",
      source = true,
   },
   signs = {
      text = {
         [vim.diagnostic.severity.ERROR] = "󰅚 ",
         [vim.diagnostic.severity.WARN] = "󰀪 ",
         [vim.diagnostic.severity.INFO] = "󰋽 ",
         [vim.diagnostic.severity.HINT] = "󰌶 ",
      },
      numhl = {
         [vim.diagnostic.severity.ERROR] = "ErrorMsg",
         [vim.diagnostic.severity.WARN] = "WarningMsg",
      },
   },
})

-- diagnostics
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Line Diagnostics" })


vim.keymap.set({ "n", "x" }, "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
   { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "x" }, "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
   { desc = "Prev Diagnostic" })

vim.keymap.set({ "n", "x" }, "<leader>ca", function() require("tiny-code-action").code_action() end,
   { noremap = true, silent = true })


vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
   callback = function(event)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder to buffer" })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
         { desc = "remove workspace folder from buffer" })
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
         { desc = "list workspace folders of buffer" })

      vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer = event.buf, remap = true, desc = "Goto Declaration" })
      vim.keymap.set("n", "gj", vim.lsp.buf.definition, { buffer = event.buf, remap = true, desc = "Goto Definition" })
      vim.keymap.set("n", "gk", vim.lsp.buf.type_definition, { buffer = event.buf, remap = true, desc = "Goto type definition" })
      vim.keymap.set("n", "gl", vim.lsp.buf.implementation, { buffer = event.buf, remap = true, desc = "Goto implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, remap = true, desc = "Goto references" })
      vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = event.buf, remap = true, desc = "Open Diagnostic Float" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, noremap = true, desc = "Hover Documentation" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = event.buf, remap = true, desc = "Signature Documentation" })
      -- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, remap = true, desc = "Rename all references" })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = event.buf, remap = true, desc = "Format" })
      -- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,  { buffer = event.buf,noremap= true, desc = "Code action"           })
      vim.keymap.set("n", "<leader>lv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
         { buffer = event.buf, remap = true, desc = "Goto Definition in Vertical Split" })

      local function client_supports_method(client, method, bufnr)
         if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
         else
            return client.supports_method(method, { bufnr = bufnr })
         end
      end

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
         local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

         -- When cursor stops moving: Highlights all instances of the symbol under the cursor
         -- When cursor moves: Clears the highlighting
         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
         })
         vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
         })

         -- When LSP detaches: Clears the highlighting
         vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
               vim.lsp.buf.clear_references()
               vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
         })
      end
   end,

})
