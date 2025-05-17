---@type table
local M = {
    root_dir = function(fname)
        local root = vim.fs.dirname(vim.fs.find({ ".moxide.toml" }, { path = fname, upward = true })[1])
        return root
    end,
}

return M
