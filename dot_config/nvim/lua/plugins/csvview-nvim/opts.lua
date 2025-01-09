---@class CsvViewOptions
---@type CsvViewOptions
local opts = {
    parser = {
        ---@type integer
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
