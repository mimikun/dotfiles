---@type table
local fzf = {
    win_configs = {
        relative = "win",
        anchor = "NW",
        height = 1,
    },
    prompt = "%#htmlTag# ",
    char_pattern = "[%w%p]",
    retain_inner_spaces = true,
    fuzzy_find_on_click = true,
}

return fzf
