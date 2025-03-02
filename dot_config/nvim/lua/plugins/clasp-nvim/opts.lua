---@type table
local opts = {
    pairs = {
        ["{"] = "}",
        ['"'] = '"',
        ["'"] = "'",
        ["("] = ")",
        ["["] = "]",
        ["<"] = ">",
    },
    keep_insert_mode = true,
    remove_pattern = nil,
}

return opts
