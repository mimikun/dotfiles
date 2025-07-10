---@type table
local opts = {
    sidebar = {
        width = 45, -- Width of the sidebar
        border = "single", -- Border style: 'single', 'double', 'rounded', etc.
    },
    indent = {
        rule = 0, -- Indentation for rule lines
        location = 2, -- Indentation for location lines
        alert = 4, -- Indentation for alert lines
    },
}

---@type LazySpec
local spec = {
    "fguisso/sfer.nvim",
    --lazy = false,
    cmd = "SarifSidebar",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
