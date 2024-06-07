---@type table
local cmds = {
    "NoNeckPain",
    "NoNeckPainResize",
    "NoNeckPainToggleLeftSide",
    "NoNeckPainToggleRightSide",
    "NoNeckPainWidthUp",
    "NoNeckPainWidthDown",
}

---@type LazySpec
local spec = {
    "shortcuts/no-neck-pain.nvim",
    --lazy = false,
    cmd = cmds,
    --keys = "",
    --event = "VeryLazy",
    --cond = false,
}

return spec
