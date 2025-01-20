---@type LazySpec
local spec = {
    "nvzone/menu",
    --lazy = false,
    cmd = "NvzoneMenuOpen",
    dependencies = { "nvzone/volt" },
    config = function()
        vim.api.nvim_create_user_command("NvzoneMenuOpen", function()
            require("menu").open("default")
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
