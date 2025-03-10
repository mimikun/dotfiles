---@type table
local opts = {
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    },
}

---@type LazySpec
local spec = {
    "ya2s/nvim-cursorline",
    --lazy = false,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
