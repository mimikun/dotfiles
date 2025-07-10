---@type Popc.Config
local opts = {
    icons = {
        popc = "󰯙",
        tabuf = "",
        bookmark = "",
        workspace = "",
        focus = "▪",
        win = "▫",
        tab = "",
        tab_scope = { "(", "╭", "│", "╰" },
        tab_focus = { "[", "┏", "┃", "┗" },
        tlbuf = "", -- Tabline buffer icon
        tltab = "", -- Tabline tabpage icon
        pointer = "󰜴",
        select = "",
        dots = "…",
        pads = { "", "" },
        nums = { "⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹" },
    },
    usermode = {
        input = nil, -- 'snacks'
    },
    selection = {
        enable = false,
    },
}

return opts
