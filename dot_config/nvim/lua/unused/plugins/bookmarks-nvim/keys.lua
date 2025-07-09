---@type table
local key_mode = { "n", "v" }

---@type LazyKeysSpec[]
local keys = {
    {
        "mm",
        function()
            require("bookmarks").toggle_mark()
        end,
        mode = key_mode,
        desc = "Mark current line into active BookmarkList.",
    },
    {
        "mo",
        function()
            require("bookmarks").goto_bookmark()
        end,
        mode = key_mode,
        desc = "Go to bookmark at current active BookmarkList",
    },
    {
        "ma",
        function()
            require("bookmarks").commands()
        end,
        mode = key_mode,
        desc = "Find and trigger a bookmark command.",
    },
}

return keys
