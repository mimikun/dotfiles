---@type table
local workspaces = {
    {
        name = "personal",
        path = vim.fn.expand("$obsidian_vault_path"),
        overrides = {
            notes_subdir = "000_Inbox",
            daily_notes = {
                folder = "001_DailyNotes",
                date_format = "%Y年%m月%d日",
                --alias_format = "%B %-d, %Y",
                default_tags = {
                    "daily-note",
                    "daily-notes",
                },
                -- NOTE: Edit now
                --template = nil,
                workdays_only = false,
            },
            new_notes_location = "notes_subdir",
            templates = {
                subdir = "999_Templates",
                date_format = "%Y年%m月%d日",
                time_format = "%H:%M",
                -- NOTE: Edit now
                --substitutions = substitutions,
            },
            attachments = {
                img_folder = "998_Attachments",
            },
        },
    },
    {
        name = "work",
        path = "~/.obsidian-vaults/work",
        overrides = {
            new_notes_location = "current_dir",
            attachments = {
                img_folder = "assets/imgs",
            },
        },
    },
}

return workspaces
