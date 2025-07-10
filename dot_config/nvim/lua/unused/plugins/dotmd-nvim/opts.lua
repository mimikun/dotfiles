local global = require("config.global")

---@type string
local root_dir = table.concat({ global.home, "dotmd" }, global.path_sep)

---@type string
local picker = "snacks" -- or "fzf" or "telescope" or "mini" based on your preference

---@type DotMd.Config
local opts = {
    root_dir = root_dir,
    default_split = "none",
    rollover_todo = {
        enabled = false,
        heading = { "Tasks" },
    },
    picker = picker,
    templates = {
        notes = function(title)
            return {
                "---",
                "title: " .. title,
                "created: " .. os.date("%Y-%m-%d %H:%M"),
                "---",
                "",
                "# " .. title,
                "",
            }
        end,
        todos = function(date)
            return {
                "---",
                "type: todo",
                "date: " .. date,
                "---",
                "",
                "# Todo for " .. date,
                "",
                "## Tasks",
                "",
            }
        end,
        journals = function(date)
            return {
                "---",
                "type: journal",
                "date: " .. date,
                "---",
                "",
                "# Journal Entry for " .. date,
                "",
                "## Highlights",
                "",
                "## Thoughts",
                "",
                "## Tasks",
                "",
            }
        end,
        inbox = function()
            return {
                "---",
                "type: inbox",
                "---",
                "",
                "# Inbox",
                "",
                "## Quick Notes",
                "",
                "## Tasks",
                "",
                "## References",
                "",
            }
        end,
    },
}

return opts
