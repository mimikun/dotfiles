---@type LazyKeysSpec[]
local keys = {
    {
        "<C-CR>",
        function()
            require("in-and-out").in_and_out()
        end,
        mode = "i",
    },
}

---@type table
local opts = {
    additional_targets = { "“", "”" },
}

---@type LazySpec
local spec = {
    "ysmb-wtsg/in-and-out.nvim",
    --lazy = false,
    keys = keys,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
