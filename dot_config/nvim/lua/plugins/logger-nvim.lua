---@type LazyKeysSpec
local keys = {
    {
        "<leader>hL",
        function()
            require("logger").viewRuntimeLog()
        end,
        mode = "n",
        silent = true,
    },
}

---@type LazySpec
local spec = {
    "mimikun/spec-template",
    --lazy = false,
    keys = keys,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
