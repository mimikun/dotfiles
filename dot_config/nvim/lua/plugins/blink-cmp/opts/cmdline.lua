---@module 'blink.cmp'
---@type blink.cmp.CmdlineConfig
local cmdline = {
    enabled = true,
    keymap = {
        ["<Tab>"] = { "show", "accept" },
    },
    sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
            return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
            return { "cmdline", "path" }
        end
        return {}
    end,
    completion = {
        menu = {
            auto_show = true,
        },
    },
}

return cmdline
