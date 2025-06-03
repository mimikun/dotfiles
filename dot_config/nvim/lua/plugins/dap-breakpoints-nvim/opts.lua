---@type DapBpConfig
local opts = {
    virtual_text = {
        enabled = true,
        priority = 10,
        current_line_only = false,
        ---@type "default" | "separate" | "icons_only" | "messages_only"
        preset = "default",
        ---@type string order of conditional, hit_condition, log_point, omit a char to hide that type
        order = "chl",
        layout = {
            ---@type "eol" | "right_align" | integer
            position = 121,
            spaces = 4,
        },
    },
}

return opts
