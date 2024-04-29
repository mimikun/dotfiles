---@type LazySpec
local spec = {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
        groups = {
            "Normal",
            "NormalNC",
            "Comment",
            "Constant",
            "Special",
            "Identifier",
            "Statement",
            "PreProc",
            "Type",
            "Underlined",
            "Todo",
            "String",
            "Function",
            "Conditional",
            "Repeat",
            "Operator",
            "Structure",
            "LineNr",
            "NonText",
            "SignColumn",
            "CursorLine",
            "CursorLineNr",
            "StatusLine",
            "StatusLineNC",
            "EndOfBuffer",
        },
        extra_groups = {},
        exclude_groups = {},
    },
    --cond = false,
}

return spec
