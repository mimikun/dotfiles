local sources = {
    default = { "lsp", "path", "luasnip", "buffer" },
    cmdline = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
            return { "buffer" }
        end
        -- Commands
        if type == ":" then
            return { "cmdline" }
        end
        return {}
    end,
    min_keyword_length = function()
        return 0
    end,
    providers = require("plugins.blink-cmp.opts.sources.providers"),
}

return sources
