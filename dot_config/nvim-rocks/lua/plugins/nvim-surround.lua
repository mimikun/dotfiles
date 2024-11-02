---@type table
local opts = {}

---@type table
local ui_opts = {
    root_key = "S",
}

require("nvim-surround").setup(opts)
require("surround-ui").setup(ui_opts)
