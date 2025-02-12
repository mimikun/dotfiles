---@type LazyKeysSpec[]
local keys = {
    {
        "<Leader>nn",
        mode = "n",
        desc = "Opens new note for editing",
    },
    {
        "<Leader>nd",
        mode = "n",
        desc = "Opens new or existing daily note",
    },
    {
        "<Leader>nw",
        mode = "n",
        desc = "Opens new or existing weekly note",
    },
    {
        "<Leader>nl",
        mode = "n",
        desc = "List with prefixed label, sorted alphabetically; mtime if journal",
    },
    {
        "<Leader>nm",
        mode = "n",
        desc = "List with prefixed date modified, sorted by mtime",
    },
    {
        "<Leader>nc",
        mode = "n",
        desc = "List with prefixed date created (YYYY/WeekXX), sorted by ctime",
    },
    {
        "<Leader>nk",
        mode = "n",
        desc = "List all links related to active note (or all if none)",
    },
    {
        "<Leader>ns",
        mode = "n",
        desc = "Full text search with prefixed note title",
    },
    {
        "<Leader>nW",
        mode = "n",
        desc = "Opens browser with embedded web/app (auto stop webserver on idle)",
    },
}

return keys
