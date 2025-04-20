---@type table
local opts = {
    parser = {
        delimiter = {
            default = ",",
            ft = {
                tsv = "\t",
            },
        },
        quote_char = '"',
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
