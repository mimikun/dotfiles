---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local css_vars = {
    name = "css-vars",
    module = "css-vars.blink",
    opts = {
        -- WARNING: The search is not optimized to look for variables in JS files.
        -- If you change the search_extensions you might get false positives and weird completion results.
        search_extensions = {
            ".js",
            ".ts",
            ".jsx",
            ".tsx",
        },
    },
}

return css_vars
