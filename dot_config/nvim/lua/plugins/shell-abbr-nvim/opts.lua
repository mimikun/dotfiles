---@type Config
local opts = {
    fish = {
        enabled = true,
    },
    zsh = {
        plugins = {
            ["zsh-abbr"] = {
                enabled = false,
            },
            ["zsh-abbrev-alias"] = {
                enabled = false,
            },
        },
    },
}

return opts
