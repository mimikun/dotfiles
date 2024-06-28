---@type table
local events = {
    "BufReadPre",
    "BufNewFile",
}

---@type table
local dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
}

-- TODO: Use utils/icons.lua
---@type table
local opts = {
    symbols = {
        modified = "●",
        ellipsis = "…",
        separator = "",
    },
    kinds = {
        File = "",
        Module = "",
        Namespace = "",
        Package = "",
        Class = "",
        Method = "",
        Property = "",
        Field = "",
        Constructor = "",
        Enum = "",
        Interface = "",
        Function = "",
        Variable = "",
        Constant = "",
        String = "",
        Number = "",
        Boolean = "",
        Array = "",
        Object = "",
        Key = "",
        Null = "",
        EnumMember = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
}

---@type LazySpec
local spec = {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    --lazy = false,
    cmd = "Barbecue",
    event = events,
    dependencies = dependencies,
    opts = opts,
    cond = false,
}

return spec
