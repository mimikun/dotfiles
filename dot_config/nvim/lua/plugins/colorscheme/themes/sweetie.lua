-- NOTE: Not support "transparent = true"
---@type LazySpec
local spec = {
    "NTBBloodbath/sweetie.nvim",
    --lazy = false,
    init = function()
        vim.g.sweetie = {
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
    end,
    --cond = false,
}

return spec
