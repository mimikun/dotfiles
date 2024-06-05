-- NOTE: Not support "transparent = true"
---@type LazySpec
local spec = {
    "m15a/nvim-srcerite",
    --lazy = false,
    dependencies = { "Iron-E/nvim-highlite" },
    init = function()
        vim.g.srcerite_inverse_visual = true
        vim.g.srcerite_inverse_search = false
        vim.g.srcerite_inverse_match_paren = false
    end,
    --cond = false,
}

return spec
