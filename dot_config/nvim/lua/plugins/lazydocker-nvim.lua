---@type LazySpec
local spec = {
    "mgierada/lazydocker.nvim",
    --lazy = false,
    cmd = "Lazydocker",
    event = "BufRead",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = true,
    --cond = false,
}

return spec
