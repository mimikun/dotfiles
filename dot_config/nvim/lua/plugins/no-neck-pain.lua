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
    --cond = false,
}

return spec
