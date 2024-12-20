---@param names string[]
---@return string[]
local function get_plugin_paths(names)
    local plugins = require("lazy.core.config").plugins
    local paths = {}
    for _, name in ipairs(names) do
        if plugins[name] then
            table.insert(paths, plugins[name].dir .. "/lua")
        else
            vim.notify("Invalid plugin name" .. name)
        end
    end
    return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
    local paths = get_plugin_paths(plugins)
    table.insert(paths, vim.fn.stdpath("config") .. "/lua")
    table.insert(paths, vim.env.VIMRUNTIME .. "/lua")
    table.insert(paths, "${3rd}/luv/library")
    table.insert(paths, "${3rd}/busted/library")
    table.insert(paths, "${3rd}/luassert/library")
    return paths
end

local M = {
    settings = {
        Lua = {
            --diagnostics = {},
            format = {
                -- Use stylua
                enable = false,
            },
            runtime = {
                version = "LuaJIT",
                pathStrict = true,
                path = { "?.lua", "?/init.lua" },
            },
            semantic = {
                enable = false,
            },
            workspace = {
                checkThirdParty = "Disable",
                library = library({ "lazy.nvim" }),
            },
        },
    },
}

return M
