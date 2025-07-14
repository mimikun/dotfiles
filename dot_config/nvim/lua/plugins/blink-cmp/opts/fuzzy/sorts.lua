---@type table
local sorts = {
    function(a, b)
        local sort = require("blink.cmp.fuzzy.sort")
        if a.source_id == "spell" and b.source_id == "spell" then
            return sort.label(a, b)
        end
    end,
    -- This is the normal default order, which we fall back to
    "score",
    "kind",
    "label",
}

return sorts
