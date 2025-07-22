---@type LazySpec[]
local dependencies = {
    "nvim-orgmode/orgmode",
    {
        "lukas-reineke/headlines.nvim",
        config = true,
        optional = true,
    },
}

return dependencies
