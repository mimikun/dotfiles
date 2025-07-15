---@type table
local opts = {
    info = "h",
    start = "s",
    stop = "x",
    restart = "r",
    close = "q",
}

---@type LazySpec
local spec = {
    -- NOTE:WORKAROUND: use my fork until fix bug
    "mimikun/lspctl.nvim",
    branch = "fix-doc",
    --"clxmochamalefic/lspctl.nvim",
    --lazy = false,
    cmd = "Lspctl",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
