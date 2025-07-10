---@type table
local excluded_filetypes = {
    "startify",
    "git-commit",
    "leaderf",
    "NvimTree",
    "tagbar",
    "defx",
    "neo-tree",
    "qf",
}

---@type table
local shape = {
    head = "▲",
    body = "█",
    tail = "▼",
}

---@type table
local opts = {
    max_size = 10,
    min_size = 5,
    width = 1,
    right_offset = 1,
    excluded_filetypes = excluded_filetypes,
    shape = shape,
}

return opts
