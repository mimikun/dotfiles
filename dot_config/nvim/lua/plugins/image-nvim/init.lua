---@type boolean
local cond = require("config.global").is_linux

---@type LazySpec
local spec = {
    "3rd/image.nvim",
    -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    build = false,
    --lazy = false,
    cmd = require("plugins.image-nvim.cmds"),
    config = function()
        local image = require("image")
        image.setup(require("plugins.image-nvim.opts"))

        vim.api.nvim_create_user_command("ImageEnable", function()
            image.enable()
        end, {})
        vim.api.nvim_create_user_command("ImageDisable", function()
            image.disable()
        end, {})
    end,
    cond = cond,
    enabled = cond,
}

return spec
