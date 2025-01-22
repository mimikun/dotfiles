---@type table
local cmds = {
    "DotfyleGenerate",
    "DotfyleOpen",
}

---@type LazySpec
local spec = {
    -- HACK: workaround for lspconfig breaking change
    "mimikun/dotfyle-metadata.nvim",
    branch = "fix/lspconfig",
    --"creativenull/dotfyle-metadata.nvim",
    --lazy = false,
    cmd = cmds,
    --cond = false,
    --enabled = false,
}

return spec
