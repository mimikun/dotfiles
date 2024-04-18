---@type table
local dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
}

---@type LazySpec
local spec = {
    "jay-babu/mason-null-ls.nvim",
    --lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies,
    opts = {
        handlers = {},
    },
    -- TODO: settings
    --cond = false,
}

return spec
