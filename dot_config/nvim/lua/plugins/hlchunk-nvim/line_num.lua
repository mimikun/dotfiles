---@type table
local line_num = {
    enable = true,
    style = "#806d9c",
    notify = false,
    priority = 10,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
        -- some other filetypes
    },
    -- unique options
    use_treesitter = false,
}

return line_num
