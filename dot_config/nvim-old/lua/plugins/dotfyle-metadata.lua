---@type table
local cmds = {
    "DotfyleGenerate",
    "DotfyleOpen",
}

---@type LazySpec
local spec = {
    "creativenull/dotfyle-metadata.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    --config = function() end,
    --cond = false,
}

return spec
