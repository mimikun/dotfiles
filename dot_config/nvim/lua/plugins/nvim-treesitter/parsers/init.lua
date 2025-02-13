local must = require("plugins.nvim-treesitter.parsers.must")
local recommended = require("plugins.nvim-treesitter.parsers.recommended")

---@type table
local parsers = {
    "c",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
}

-- NOTE: PRESS d10 when setting up for
-- the first time in a low-spec environment
parsers = vim.list_extend(parsers, must.must)
parsers = vim.list_extend(parsers, recommended.recommended)

if require("config.global").is_linux then
    parsers = vim.list_extend(parsers, must.linux)
    parsers = vim.list_extend(parsers, recommended.linux)
end

table.sort(parsers)

return parsers
