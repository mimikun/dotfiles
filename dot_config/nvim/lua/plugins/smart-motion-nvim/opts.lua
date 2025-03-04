---@type table
local opts = {
    mappings = {
        n = {
            w = {
                function()
                    require("smart-motion").hint_words(
                        require("smart-motion").consts.DIRECTION.AFTER_CURSOR,
                        require("smart-motion").consts.HINT_POSITION.START,
                        true
                    )
                end,
                desc = "smart-motion forward word",
            },
            b = {
                function()
                    require("smart-motion").hint_words(
                        require("smart-motion").consts.DIRECTION.BEFORE_CURSOR,
                        require("smart-motion").consts.HINT_POSITION.START,
                        true
                    )
                end,
                desc = "smart-motion backward word",
            },
            e = {
                function()
                    require("smart-motion").hint_words(
                        require("smart-motion").consts.DIRECTION.AFTER_CURSOR,
                        require("smart-motion").consts.HINT_POSITION.END,
                        true
                    )
                end,
                desc = "smart-motion forward to word end",
            },
            ge = {
                function()
                    require("smart-motion").hint_words(
                        require("smart-motion").consts.DIRECTION.BEFORE_CURSOR,
                        require("smart-motion").consts.HINT_POSITION.END,
                        true
                    )
                end,
                desc = "smart-motion backward to word end",
            },
        },
        v = {},
    },
}

return opts
