---@type LazySpec
local spec = {
    "mgierada/lazydocker.nvim",
    --lazy = false,
    cmd = "Lazydocker",
    event = "BufRead",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = {},
    --cond = false,
}

return spec
