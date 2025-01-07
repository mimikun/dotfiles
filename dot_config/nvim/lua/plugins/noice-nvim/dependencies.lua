---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
}

if not require("config.settings").use_blink_cmp then
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
