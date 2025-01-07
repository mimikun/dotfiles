---@type LazySpec[]
local dependencies = {
    "nvimdev/lspsaga.nvim",
}

if not require("config.settings").use_blink_cmp then
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
