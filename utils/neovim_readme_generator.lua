--thx: dotfyle-metadata.nvim
local uv = vim.uv

local data = {}

local install_plugins = function()
    local plugins = {}

    for _, plugin in pairs(require("lazy").plugins()) do
        local name = plugin.name
        local url = plugin.url
        local deps = plugin.dependencies
        local repo = string.format("- [%s](%s)", name, url)
        table.insert(data, repo)
        if deps then
            table.insert(data, "dependencies")
            for _, d_plugin in pairs(deps) do
                table.insert(data, d_plugin)
            end
        end
    end

    table.sort(plugins)
    return plugins
end

table.insert(data, "## Plugins")
for _, value in pairs(install_plugins()) do
    table.insert(data, string.format("- %s", value))
end

-- OUTPUT

local metadata = table.concat(data, "\n")

local readme_path = string.format("%s/PLUG.md", vim.fn.stdpath("config"))
local fd = assert(uv.fs_open(readme_path, "w", 438))
assert(uv.fs_write(fd, metadata))
assert(uv.fs_close(fd))
