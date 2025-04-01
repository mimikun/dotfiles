local global = require("config.global")

---@type string
local friendly_snippets = table.concat({ global.friendly_snippets, "package.json" }, global.path_sep)

---@type yasp.Settings
local opts = {
    long_desc = true,
    prose = false,
    debounce = 750,
    trigger_chars = {
        ["*"] = { "{", "(", "[", " ", ".", ":", "," },
        ["lua"] = { ".", ":" },
    },
    -- NOTE: the following must be provided by the user the paths to the package.json files, no default given, must be provided
    paths = {
        friendly_snippets,
    },
    -- NOTE: the accompanying descriptions for the paths, no default given, must be provided
    descs = { "FR", "USR" },
}

return opts
