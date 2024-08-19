local installed_plugins = require("lazy").plugins()
local installed_servers = require("lspconfig").util.available_servers()
local installed_parsers = require("nvim-treesitter.configs").get_ensure_installed_parsers()
local installed_packages = require("mason-registry").get_installed_package_names()

-- Get plugins markdown-link
local plugins = {
    string.format("## Plugins - %s plugins", vim.tbl_count(installed_plugins)),
}

vim.iter(installed_plugins):map(function(p)
    local name = p.name
    local url = string.gsub(p.url, ".git$", "")
    local md_link = string.format("- [%s](%s)", name, url)
    table.insert(plugins, md_link)
end)

-- Get lsp servers
local servers = {
    string.format("## LSP servers - %s servers", vim.tbl_count(installed_servers)),
}

vim.iter(installed_servers):map(function(s)
    local name = string.format("- %s", s)
    table.insert(servers, name)
end)

-- Get the installed treesitter parsers
local parsers = {
    string.format("## Treesitter parsers - %s parsers", vim.tbl_count(installed_parsers)),
}

vim.iter(installed_parsers):map(function(p)
    local name = string.format("- %s", p)
    table.insert(parsers, name)
end)

-- Get the installed packages by mason.nvim
-- NOTE: https://github.com/williamboman/mason.nvim/discussions/1026

local packages = {
    string.format("## Mason installed packages - %s packages", vim.tbl_count(installed_packages)),
}

vim.iter(installed_packages):map(function(p)
    local name = string.format("- %s", p)
    table.insert(packages, name)
end)

table.sort(plugins)
table.sort(servers)
table.sort(parsers)
table.sort(packages)

local title = {
    "# neovim config",
}

local readme = {}

readme = vim.list_extend(readme, title)
readme = vim.list_extend(readme, plugins)
readme = vim.list_extend(readme, servers)
readme = vim.list_extend(readme, parsers)
readme = vim.list_extend(readme, packages)

local disp = function(elem)
    local tmp = table.concat(elem, "\n")
    print(tmp)
end

disp(readme)

-- OUTPUT sample
--[[
# neovim config

## Plugins - 138 plugins
- [human-rights.nvim](https://github.com/mimikun/human-rights.nvim)
...

## LSP servers - 5 servers
- lua_ls
...

## Treesitter parsers - 8 parsers
- lua
...

## Mason installed packages - 17 packages
- stylua
...
]]

local txt = table.concat(readme, "\n")

-- file output
local file_path = string.format("%s/README-generated.md", vim.fn.stdpath("config"))
local fd = assert(vim.uv.fs_open(file_path, "w", 438))
assert(vim.uv.fs_write(fd, txt))
assert(vim.uv.fs_close(fd))
