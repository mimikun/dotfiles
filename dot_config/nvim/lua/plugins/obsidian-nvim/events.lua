---@type string
local vault_path = vim.fn.expand("$obsidian_vault_path")

---@type table
local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

return events
