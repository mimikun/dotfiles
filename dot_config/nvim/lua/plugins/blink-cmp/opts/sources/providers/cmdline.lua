---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local cmdline = {
    min_keyword_length = function(ctx)
        -- when typing a command, only show when the keyword is 3 characters or longer
        if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
            return 3
        end
        return 0
    end,
}

return cmdline
