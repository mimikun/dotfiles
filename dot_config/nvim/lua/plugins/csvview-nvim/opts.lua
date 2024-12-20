---@class CsvViewOptions
---@type CsvViewOptions
local opts = {
    parser = {
        ---@type integer
        -- TODO: try reducing this value, human rights
        async_chunksize = 50,

        --- @type string[]
        comments = {
            "#",
            "--",
            "//",
        },
    },
    view = {
        ---@type "highlight" | "border"
        display_mode = "border",
    },
}

return opts
