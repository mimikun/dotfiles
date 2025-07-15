---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>q",
        function()
            require("displace.navigator").show_window_numbers()
        end,
        desc = "Navigate to window",
    },
}

---@type LazySpec
local spec = {
    "nicholascross/displace.nvim",
    --lazy = false,
    cmd = "Displace",
    keys = keys,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
