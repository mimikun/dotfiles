---@type table
local cmds = {
    "NoNeckPain",
    "NoNeckPainResize",
    "NoNeckPainToggleLeftSide",
    "NoNeckPainToggleRightSide",
    "NoNeckPainWidthUp",
    "NoNeckPainWidthDown",
}

---@type table
local opts = {
    integrations = {
        --- @type table
        NvimTree = {
            -- The position of the tree.
            --- @type "left"|"right"
            position = "left",
        },
    },
}

---@type LazySpec
local spec = {
    "shortcuts/no-neck-pain.nvim",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
