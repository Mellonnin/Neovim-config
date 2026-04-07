vim.lsp.enable({
   "jdtls",
   "lua_ls",
   "gopls",
   "sqlls",
   "pyrefly",
   "clangd",
   "elixir-ls",
   "bash-language-server",
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

local dropdown = require("telescope.themes").get_dropdown({
  layout_strategy = 'center',
  layout_config = {
    -- anchor = 'N',
    height = 0.60,
    width = 0.9,
  },
  previewer = false,
  prompt_title = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
   callback = function(args)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder to buffer" })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
         { desc = "remove workspace folder from buffer" })
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
         { desc = "list workspace folders of buffer" })

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, noremap = true, desc = "Hover Documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer = args.buf, remap = true, desc = "Goto Declaration" })
      -- vim.keymap.set("n", "gj", vim.lsp.buf.definition, { buffer = args.buf, remap = true, desc = "Goto Definition" })
      -- vim.keymap.set("n", "gk", vim.lsp.buf.type_definition, { buffer = args.buf, remap = true, desc = "Goto type definition" })
      -- vim.keymap.set("n", "gl", vim.lsp.buf.implementation, { buffer = args.buf, remap = true, desc = "Goto implementation" })
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf, remap = true, desc = "Goto references" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = args.buf, remap = true, desc = "Signature Documentation" })
      -- vim.keymap.set("n", "go", vim.lsp.buf.outgoing_calls, { buffer = args.buf, remap = true, desc = "outgoing_calls" })
      -- vim.keymap.set("n", "gc", vim.lsp.buf.incoming_calls, { buffer = args.buf, remap = true, desc = "incoming_calls" })
      vim.keymap.set("n", "gt", vim.lsp.buf.typehierarchy, { buffer = args.buf, remap = true, desc = "typehierarchy" })
      -- vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = args.buf, remap = true, desc = "Open Diagnostic Float" })
      vim.keymap.set("n", "<leader>lr", "grn", {remap = true, desc = "Rename all references" })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = args.buf, remap = true, desc = "Format" })
      vim.keymap.set("n", "<leader>la", function() require("tiny-code-action").code_action() end, { noremap = true, silent = true })






      -- vim.keymap.set("n","gd",function() require("telescope.builtin").lps_type_declaration(require("telescope.themes").get_dropdown { previewer = false }) end )
      -- vim.keymap.set("n","gt",function() require("telescope.builtin").lsp_typehierarchy(require("telescope.themes").get_dropdown { previewer = false }) end )
      vim.keymap.set("n","gj",function() require("telescope.builtin").lsp_definitions(dropdown) end )
      vim.keymap.set("n","gk",function() require("telescope.builtin").lsp_type_definitions(dropdown) end )
      vim.keymap.set("n","gl",function() require("telescope.builtin").lsp_implementations(dropdown) end )
      vim.keymap.set("n","gr",function() require("telescope.builtin").lsp_references(dropdown)end)
      vim.keymap.set("n","go",function() require("telescope.builtin").lsp_outgoing_calls(dropdown) end )
      vim.keymap.set("n","gc",function() require("telescope.builtin").lsp_incoming_calls(dropdown) end )



--  ]d jumps to the next diagnostic in the buffer. ]d-default
-- [d jumps to the previous diagnostic in the buffer. [d-default
-- ]D jumps to the last diagnostic in the buffer. ]D-default
-- [D jumps to the first diagnostic in the buffer. [D-default 
-- C-s in insert e' signature help





      local function client_supports_method(client, method, bufnr) return client:supports_method(method, bufnr) end
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then
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
