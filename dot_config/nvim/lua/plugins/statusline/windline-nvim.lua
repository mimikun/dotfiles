---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    "windwp/windline.nvim",
    --lazy = false,
    event = events,
    config = function()
        require("wlsample.vscode")
    end,
    cond = false,
}

return spec
