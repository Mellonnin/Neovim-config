vim.lsp.enable({
   "jdtls",
   "lua_ls",
   "gopls",
   "sqlls",
   "pyrefly",
   "clangd",
   "elixir-ls",
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
   callback = function(args)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder to buffer" })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
         { desc = "remove workspace folder from buffer" })
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
         { desc = "list workspace folders of buffer" })

      vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer = args.buf, remap = true, desc = "Goto Declaration" })
      vim.keymap.set("n", "gj", vim.lsp.buf.definition, { buffer = args.buf, remap = true, desc = "Goto Definition" })
      vim.keymap.set("n", "gk", vim.lsp.buf.type_definition, { buffer = args.buf, remap = true, desc = "Goto type definition" })
      vim.keymap.set("n", "gl", vim.lsp.buf.implementation, { buffer = args.buf, remap = true, desc = "Goto implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf, remap = true, desc = "Goto references" })
      vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = args.buf, remap = true, desc = "Open Diagnostic Float" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, noremap = true, desc = "Hover Documentation" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = args.buf, remap = true, desc = "Signature Documentation" })
      --vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = args.buf, remap = true, desc = "Rename all references" })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = args.buf, remap = true, desc = "Format" })
      -- vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,  { buffer = args.buf,noremap= true, desc = "Code action"           })
      vim.keymap.set("n", "<leader>lv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
         { buffer = args.buf, remap = true, desc = "Goto Definition in Vertical Split" })

      local function client_supports_method(client, method, bufnr)
         if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
         else
            return client.supports_method(method, { bufnr = bufnr })
         end
      end

      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then

    -- client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
    -- vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
    --   buffer = args.buf,
    --   callback = function()
    --      vim.lsp.completion.get()
    --   end
    -- })
    -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- ---]]
    -- ---[[Code required to add documentation popup for an item
    -- local _, cancel_prev = nil, function() end
    -- vim.api.nvim_create_autocmd('CompleteChanged', {
    --   buffer = args.buf,
    --   callback = function()
    --     cancel_prev()
    --     local info = vim.fn.complete_info({ 'selected' })
    --     local completionItem = vim.tbl_get(vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item')
    --     if nil == completionItem then
    --       return
    --     end
    --     _, cancel_prev = vim.lsp.buf_request(args.buf,
    --       vim.lsp.protocol.Methods.completionItem_resolve,
    --       completionItem,
    --       function(err, item, ctx)
    --         if not item then
    --           return
    --         end
    --         local docs = (item.documentation or {}).value
    --         local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
    --         if win.winid and vim.api.nvim_win_is_valid(win.winid) then
    --           vim.treesitter.start(win.bufnr, 'markdown')
    --           vim.wo[win.winid].conceallevel = 3
    --         end
    --       end)
    --   end
    -- })
    -- ---]]
         local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

         -- When cursor stops moving: Highlights all instances of the symbol under the cursor
         -- When cursor moves: Clears the highlighting
         vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
         })
         vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = args.buf,
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


  end
})
