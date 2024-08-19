---@type LazySpec[]
local dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
}

---@type barbecue.Config
local opts = {
    exclude_filetypes = { "netrw", "toggleterm" },
    symbols = {
        -- Modification indicator.
        modified = "●",
        -- Truncation indicator.
        ellipsis = "…",
        -- Entry separator.
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
    event = "BufEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    -- NOTE: winbar plugin
    enabled = false,
}

return spec
