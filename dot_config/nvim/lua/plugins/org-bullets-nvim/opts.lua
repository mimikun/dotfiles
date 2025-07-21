---@type BulletsConfig
local opts = {
    concealcursor = false,
    symbols = {
        list = "•",
        headlines = {
            "◉",
            "○",
            "✸",
            "✿",
        },
        checkboxes = {
            half = { "", "@org.checkbox.halfchecked" },
            done = { "✓", "@org.keyword.done" },
            todo = { "˟", "@org.keyword.todo" },
        },
    },
}

return opts
