-- -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--
-- local workspace_dir = '/path/to/workspace-root/' .. project_name
-- --                                               ^^
-- --                                               string concattenation in Lua
--
-- local config = {
--   cmd = {
--
--     '-data', workspace_dir,
--
--   }
-- }

return {
    cmd = { "jdtls" },                                   -- Command to start the language server
    filetypes = {"java"}, -- File types that this server will handle
    root_markers = {".git" }, 
    settings = {
        jdtls = {
        -- Custom eclipse.jdt.ls options go here
     }
    },



}
