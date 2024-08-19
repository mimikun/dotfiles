---@notify.config
local opts = {
    background_colour = "#000000",
}

---@type LazySpec
local spec = {
    "rcarriga/nvim-notify",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
