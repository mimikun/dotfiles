---@type table
local event = {
    "BufReadPre",
    "BufNewFile",
}

---@type table
local dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
}

---@type table
local opts = {
    handlers = {},
}

---@type LazySpec
local spec = {
    "jay-babu/mason-null-ls.nvim",
    --lazy = false,
    event = events,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
