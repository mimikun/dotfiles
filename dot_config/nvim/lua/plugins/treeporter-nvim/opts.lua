---@type table
local opts = {
    --file_filter = "all",
    file_filter = "git",
    --file_filter = "non-hidden",
    max_files = 10000,
    exclude_patterns = {
        "node_modules",
        ".git",
    },
    scan_on_save = false,
    scan_on_open = false,
    keymaps = {
        index = "<leader>gi",
        search = "<leader>gs",
    },
}

return opts
