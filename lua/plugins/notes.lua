return {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            keymaps = {
                toggle_window = "<leader>td",
                new_todo = "i",
                toggle_todo = "x",
                delete_todo = "d",
                delete_completed = "D",
                close_window = "q",
                add_due_date = "H",
                remove_due_date = "r",
                undo_delete = "u", -- Undo delete
                toggle_help = "?",
                toggle_tags = "t",
                clear_filter = "c",
                edit_todo = "e",
                edit_tag = "e",
                delete_tag = "d",
                search_todos = "/",
                import_todos = "I",
                export_todos = "E",
                remove_duplicates = "<leader>D",
                toggle_priority = "<Space>" -- Toggle todo priority on creation
            },
            calendar = {                    -- Calendar options
                language = "en",
                icon = "",
                keymaps = {
                    previous_day = "h",
                    next_day = "l",
                    previous_week = "k",
                    next_week = "j",
                    previous_month = "H",
                    next_month = "L",
                    select_day = "<CR>",
                    close_calendar = "q",
                },
            },
        })
    end,
}
