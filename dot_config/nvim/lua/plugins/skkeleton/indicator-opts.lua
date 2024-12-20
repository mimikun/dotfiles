---@type table
local opts = {
    eijiHlName = "SkkeletonIndicatorEiji",
    hiraHlName = "SkkeletonIndicatorHira",
    kataHlName = "SkkeletonIndicatorKata",
    hankataHlName = "SkkeletonIndicatorHankata",
    zenkakuHlName = "SkkeletonIndicatorZenkaku",
    abbrevHlName = "SkkeletonIndicatorAbbrev",
    eijiText = "AZ",
    hiraText = "ひら",
    kataText = "カナ",
    hankataText = "ｶﾅ",
    zenkakuText = "ＡＺ",
    abbrevText = "abbr",
    border = "rounded",
    row = 0,
    col = 1,
    zindex = nil,
    alwaysShown = false,
    fadeOutMs = 3000,
    ignoreFt = {},
    bufFilter = function()
        return true
    end,
}

return opts
