---@type table
local config = {
    pumblend = {
        enable = true,
        transparency_amount = 100,
    },
    integrations = {
        lazy = true,
        neorg = true,
        neogit = true,
        neomake = true,
        telescope = true,
    },
    cursor_color = true,
    terminal_colors = true,
}

---@type table
local opts = {
    -- NOTE: Not support "transparent = true"
}

---@type LazySpec
local spec = {
    "NTBBloodbath/sweetie.nvim",
    --lazy = false,
    config = function()
        require("sweetie").setup(opts)
        vim.g.sweetie = config
    end,
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
