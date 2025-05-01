---@type table
local opts = {
    foldtext = function(folded_count)
        return "(" .. folded_count .. " comments)"
    end,
}

return opts
