local sources = {
    default = require("plugins.blink-cmp.sources.defaults"),
    cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Commands
        if type == ":" then
            return { "cmdline", "path" }
        end
        -- Search forward and backward
        if type == "/" or type == "?" then
            return { "buffer" }
        end
        return {}
    end,
    providers = require("plugins.blink-cmp.sources.providers"),
}

return sources
