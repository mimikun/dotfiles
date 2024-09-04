---@type LazyKeysSpec[]
local keys = {
    {
        "<CR>",
        function()
            require("migemo-search").cr()
        end,
        mode = "c",
        desc = "Hiragana de kensaku",
    },
}

---@return boolean
local enabled = function()
    ---@type boolean
    local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
    return has_cmigemo
end

---@type LazySpec
local spec = {
    "sei40kr/migemo-search.nvim",
    --lazy = false,
    keys = keys,
    event = "CmdlineEnter",
    config = function()
        local ms = require("migemo-search")
        ms.setup({})

        vim.keymap.set("c", "<CR>", ms.cr, {})
    end,
    cond = enabled,
    enabled = enabled,
}

return spec
