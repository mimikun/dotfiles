--- folder where colorschemes will be saved to
---@type string
local export_path = table.concat({
    vim.fn.stdpath("config"),
    "colors",
}, require("config.global").path_sep)

---@type LazySpec
local spec = {
    "bhugovilela/palette.nvim",
    --lazy = false,
    cmd = "Palette",
    config = function()
        vim.g.palette_config = {
            export_path = export_path,
        }
    end,
    --cond = false,
    --enabled = false,
}

return spec
