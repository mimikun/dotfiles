local uv = vim.uv

local readme = {}

local lazy_plugins = require("lazy").plugins()

-- Get markdown reference links
---@return table
local markdown_reflinks = function()
    local data = {}

    for _, plugin in pairs(lazy_plugins) do
        local name = plugin.name
        local url = plugin.url:gsub(".git$", "")

        table.insert(data, string.format("[%s]:%s", name, url))
    end

    table.sort(data)

    return data
end

--- Get Plugin lists
---@return table
local plugin_full_list = function()
    local data = {}

    for _, plugin in pairs(lazy_plugins) do
        local name = plugin.name
        local dependencies = plugin.dependencies
        table.insert(data, string.format("- [%s]", name))
        if dependencies then
            for _, dp in pairs(dependencies) do
                table.insert(data, string.format("    - [%s]", dp))
            end
        end
    end

    return data
end

---Get lsp servers
---@return table
local lsp_servers = function()
    local lspconfig = require("lspconfig")
    local servers = lspconfig.util.available_servers()

    table.sort(servers)

    return servers
end

---Get the installed treesitter parsers by nvim-treesitter
---@return table
local treesitter_parsers = function()
    local ts = require("nvim-treesitter.configs")
    local parsers = ts.get_ensure_installed_parsers()

    table.sort(parsers)

    return parsers
end

---Get the installed lsp servers and tools by mason.nvim
---@return table
local mason_tools = function()
    local mason = require("mason")

    local install_dir = string.format("%s/bin", vim.env.MASON)

    if vim.fn.isdirectory(install_dir) == 0 then
        return {}
    end

    local files
    files = vim.split(vim.fn.globpath(install_dir, "*"), "\n", {})
    files = vim.tbl_map(function(file)
        return vim.fn.fnamemodify(file, ":t")
    end, files)

    table.sort(files)

    return files
end

table.insert(readme, "# My neovim configuration")
table.insert(readme, "")
table.insert(readme, "## Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, table.concat(plugin_full_list(), "\n"))
table.insert(readme, "")
table.insert(readme, "### Denops Plugins")
table.insert(readme, "")
table.insert(readme, "Disable when [human rights] are violated.")
table.insert(readme, "[denops.vim] needs [human rights].")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "### Vim Script Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "#### Colorscheme")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "### Lua Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "#### Colorscheme")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "## nvim-treesitter parsers")
table.insert(readme, "")
table.insert(readme, "## Mason managed tools")
table.insert(readme, "")
table.insert(readme, "## LSP servers")
table.insert(readme, "")
-- reference links
table.insert(readme, "[human rights]:https://github.com/mimikun/dotfiles/blob/master/docs/GLOSSARY.md#human-rights")
table.insert(readme, table.concat(markdown_reflinks(), "\n"))

-- OUTPUT
local metadata = table.concat(readme, "\n")

local readme_path = string.format("%s/PLUG.md", vim.fn.stdpath("config"))
local fd = assert(uv.fs_open(readme_path, "w", 438))
assert(uv.fs_write(fd, metadata))
assert(uv.fs_close(fd))
