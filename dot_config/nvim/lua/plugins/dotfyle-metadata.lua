---@type table
local cmds = {
    "DotfyleGenerate",
    "DotfyleOpen",
}

---@type LazySpec
local spec = {
    "creativenull/dotfyle-metadata.nvim",
    --lazy = false,
    cmd = cmds,
    --cond = false,
}

return spec
