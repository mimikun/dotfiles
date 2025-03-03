---@type opposites.Config
local opts = {
    max_line_length = 1000,
    use_case_sensitive_mask = true,
    use_default_opposites = true,
    use_default_opposites_by_ft = true,
    opposites = {
        ["enable"] = "disable",
        ["true"] = "false",
        ["yes"] = "no",
        ["on"] = "off",
        ["left"] = "right",
        ["up"] = "down",
        ["min"] = "max",
        ["=="] = "!=",
        ["<="] = ">=",
        ["<"] = ">",
    },
    opposites_by_ft = {
        ["lua"] = {
            ["=="] = "~=",
        },
        ["sql"] = {
            ["asc"] = "desc",
        },
    },
    notify = {
        found = false,
        not_found = true,
    },
}

return opts
