---@type GrugFarOptions
local opts = {
    -- TODO: human rights support
    -- max number of parallel replacements tasks
    maxWorkers = 4,
    resultsSeparatorLineChar = "",
    spinnerStates = {
        "󱑋 ",
        "󱑌 ",
        "󱑍 ",
        "󱑎 ",
        "󱑏 ",
        "󱑐 ",
        "󱑑 ",
        "󱑒 ",
        "󱑓 ",
        "󱑔 ",
        "󱑕 ",
        "󱑖 ",
    },
    icons = {
        enabled = true,
        fileIconsProvider = "first_available",
        actionEntryBullet = " ",
        searchInput = " ",
        replaceInput = " ",
        filesFilterInput = " ",
        flagsInput = "󰮚 ",
        pathsInput = " ",
        resultsStatusReady = "󱩾 ",
        resultsStatusError = " ",
        resultsStatusSuccess = "󰗡 ",
        resultsActionMessage = "  ",
        resultsEngineLeft = "⟪",
        resultsEngineRight = "⟫",
        resultsChangeIndicator = "┃",
        resultsAddedIndicator = "▒",
        resultsRemovedIndicator = "▒",
        resultsDiffSeparatorIndicator = "┊",
        historyTitle = "   ",
        helpTitle = " 󰘥  ",
        newline = " ",
    },
}

return opts
