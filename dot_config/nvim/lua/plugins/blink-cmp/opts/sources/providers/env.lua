---@module 'blink-cmp-env'
---@type blink-cmp-env.Options
local opts = {
    item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
    show_braces = false,
    show_documentation_window = true,
}

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local env = {
    name = "Env",
    module = "blink-cmp-env",
    opts = opts,
}

return env
