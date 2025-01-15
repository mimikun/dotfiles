---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>zf",
        function()
            require("telekasten").find_notes()
        end,
        mode = "n",
        desc = "Opens a Telescope file finder and lets you pick a note by title (file name).",
    },
    {
        "<leader>zd",
        function()
            require("telekasten").find_daily_notes()
        end,
        mode = "n",
        desc = "Find daily notes by date, via Telescope. File names are sorted by file name, most recent file first.",
    },
    {
        "<leader>zg",
        function()
            require("telekasten").search_notes()
        end,
        mode = "n",
        desc = "Search through all notes via Telescope live grep, initialized with the word under the cursor.",
    },
    {
        "<leader>zz",
        function()
            require("telekasten").follow_link()
        end,
        mode = "n",
        desc = "Take the text between the brackets of a link pointing to a linked note, or of a tag and open a Telescope file finder with it.",
    },
    {
        "<leader>zT",
        function()
            require("telekasten").goto_today()
        end,
        mode = "n",
        desc = "Pops up a Telescope finder with today's daily note pre-selected.",
    },
    {
        "<leader>zW",
        function()
            require("telekasten").goto_thisweek()
        end,
        mode = "n",
        desc = "Pops up a Telescope finder with this week's daily note pre-selected.",
    },
    {
        "<leader>zw",
        function()
            require("telekasten").find_weekly_notes()
        end,
        mode = "n",
        desc = "Find weekly notes by week, via Telescope. File names are sorted by file name, most recent file first.",
    },
    {
        "<leader>zn",
        function()
            require("telekasten").new_note()
        end,
        mode = "n",
        desc = "Prompts for a title and creates a new note by the `new_note` template, then shows it in Telescope.",
    },
    {
        "<leader>zN",
        function()
            require("telekasten").new_templated_note()
        end,
        mode = "n",
        desc = "Prompts for a title and then uses Telescope for choosing a template. When a template is selected, a new note is created with it and opened.",
    },
    {
        "<leader>zy",
        function()
            require("telekasten").yank_notelink()
        end,
        mode = "n",
        desc = "Yank a link to the current note, ready to paste.",
    },
    {
        "<leader>zc",
        function()
            require("telekasten").show_calendar()
        end,
        mode = "n",
        desc = "Opens up the calendar in a properly-sized vertical split at the very right, showing the previous, current, and next month.",
    },
    {
        "<leader>zC",
        function()
            vim.cmd("CalendarT")
        end,
        mode = "n",
        desc = "",
    },
    {
        "<leader>zi",
        function()
            require("telekasten").paste_img_and_link()
        end,
        mode = "n",
        desc = "",
    },
    {
        "<leader>zt",
        function()
            require("telekasten").toggle_todo()
        end,
        mode = "n",
        desc = "Turns a line into a `- [ ] ` todo line, or toggle between `- [ ]`, `- [x]`, and `-` .",
    },
    {
        "<leader>zp",
        function()
            require("telekasten").panel()
        end,
        mode = "n",
        desc = "Show panel",
    },
}

return keys
