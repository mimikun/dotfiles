---@type table
local M = {
    root_dir = function(fname, _)
        return require("lspconfig").util.root_pattern(".moxide.toml")(fname)
    end,
}

return M
