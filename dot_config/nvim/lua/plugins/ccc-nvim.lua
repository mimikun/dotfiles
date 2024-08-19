---@type table
local cmds = {
    "CccPick",
    "CccConvert",
    "CccHighlighterEnable",
    "CccHighlighterDisable",
    "CccHighlighterToggle",
}

---@type ccc.Options
local opts = {
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
}

---@type LazySpec
local spec = {
    "uga-rosa/ccc.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = opts,
    --cond = false,
}

return spec
