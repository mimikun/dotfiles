local M = {}

local global = require("config.global")

local data_dir = global.data_dir
local path_sep = global.path_sep

---@type string
local lazy_root = table.concat({ data_dir, "lazy" }, path_sep)
---@type string
local lazy_path = table.concat({ lazy_root, "lazy.nvim" }, path_sep)

function M.init()
    if not vim.uv.fs_stat(lazy_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazy_path,
        })
    end
    vim.opt.rtp:prepend(lazy_path)
end

return M
