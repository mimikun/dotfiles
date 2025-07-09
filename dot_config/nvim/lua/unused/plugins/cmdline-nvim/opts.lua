---@type table
local opts = {
    cmdtype = ":",
    window = {
        matchFuzzy = true,
        offset = 1,
        debounceMs = 10,
    },
    hl = {
        default = "Pmenu",
        selection = "PmenuSel",
        directory = "Directory",
        substr = "LineNr",
    },
    column = {
        maxNumber = 6,
        minWidth = 20,
    },
    binds = {
        next = "<Tab>",
        back = "<S-Tab>",
    },
}

return opts
