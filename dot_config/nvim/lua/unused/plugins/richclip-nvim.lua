---@type boolean
local cond = require("config.global").is_linux
-- TODO: this plugin is beta now
cond = false

---@type table
local opts = {
    set_g_clipboard = false,
}

---@type LazySpec
local spec = {
    "beeender/richclip.nvim",
    --lazy = false,
    cmd = "Richclip",
    config = function()
        local richclip = require("richclip")

        richclip.setup(opts)

        vim.g.clipboard = {
            name = "richclip",
            copy = {
                ["+"] = richclip.copy("+"),
                ["*"] = richclip.copy("*"),
            },
            paste = {
                ["+"] = richclip.paste("+"),
                ["*"] = richclip.paste("*"),
            },
        }
    end,
    cond = cond,
    enabled = cond,
}

return spec
