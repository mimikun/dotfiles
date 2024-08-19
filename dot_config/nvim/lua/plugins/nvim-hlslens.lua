---@type table
local cmds = {
    "HlSearchLensToggle",
    "HlSearchLensEnable",
    "HlSearchLensDisable",
}

---@type table
local keys = {
    {
        "<Leader>L",
        function()
            vim.schedule(function()
                if require("hlslens").exportLastSearchToQuickfix() then
                    vim.cmd("cw")
                end
            end)
            return ":noh<CR>"
        end,
        mode = { "n", "x" },
        { expr = true },
        desc = "run `:nohlsearch` and export results to quickfix",
    },
}

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    keys = keys,
    cmd = cmds,
    opts = {},
    --cond = false,
}

return spec
