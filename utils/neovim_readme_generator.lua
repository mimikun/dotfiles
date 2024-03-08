--thx: dotfyle-metadata.nvim

---@return table
local nvim_treesitter = function()
    ---@type table
    local parsers = require("nvim-treesitter.configs").get_ensure_installed_parsers()
    table.sort(parsers)
    return parsers
end

---@return table
local mason_tools = function()
    ---@type table
    local tools = require("mason-registry").get_installed_package_names()
    table.sort(tools)
    return tools
end

---@return table
local lsp_servers = function()
    ---@type table
    local servers = require("lspconfig").util.available_servers()
    table.sort(servers)
    return servers
end

-- TODO: plugin enum spec
-- e.g. lualine.nvim
local sample = {
    name = "lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim",
    deps = {
        {
            name = "nvim-web-devicons",
            url = "https://github.com/nvim-tree/nvim-web-devicons",
            deps = nil,
        },
        {
            name = "lewis6991/gitsigns.nvim",
            url = "https://github.com/lewis6991/gitsigns.nvim",
            deps = nil,
        },
    },
}

-- TODO:
local install_plugins = function()
    local plugins = {}

    --[[
    for _, plugin in pairs(require("lazy").plugins()) do
        local name = plugin.name
        local url = plugin.url
        local deps = plugin.dependencies
        local repo = string.format("- [%s](%s)", name, url)
        print(repo)
        if deps then
            print("dependencies")
            for _, d_plugin in pairs(deps) do
                print(d_plugin)
            end
        end
        --table.insert(list, { name, url, deps })
    end
    ]]
    table.sort(plugins)
    return plugins
end

-- TODO:
local mapped_keymaps = function()
    local function check_map(keymap)
        -- check if the mapping is one we want to include

        if
            keymap.mode ~= "n"
            and keymap.mode ~= "i"
            and keymap.mode ~= "x"
            and keymap.mode ~= "v"
            and keymap.mode ~= "t"
        then
            return false
        end
        if string.find(keymap.lhs, "<Plug>") then
            return false
        end

        return true
    end

    local keymaps = {}
    local global_keymaps = vim.api.nvim_get_keymap("")

    for _, map in pairs(global_keymaps) do
        -- translate the strings into something usable by :map
        map.lhs = vim.fn.maparg(map.lhs, map.mode, false, true).lhs

        if map.callback then
            -- check if the mapping is a function
            -- HACK: can't encode a function
            -- but we should probably write out what it does
            map.rhs = "<function>"
        elseif map.rhs == "" then
            -- replace the empty string with empty modifier
            map.rhs = "<Nop>"
        end

        if check_map(map) then
            table.insert(keymaps, {
                mode = map.mode,
                lhs = map.lhs,
                rhs = map.rhs,
                desc = map.desc == nil and "" or map.desc,
                noremap = map.noremap == 1,
            })
        end
    end
end

-- OUTPUT
print("# My neovim configuration")
print("\n")
print("## nvim-treesitter parsers")
print("\n")
for _, value in pairs(nvim_treesitter()) do
    print(string.format("- %s", value))
end
print("\n")
print("## Mason managed tools")
print("\n")
for _, value in pairs(mason_tools()) do
    print(string.format("- %s", value))
end
print("\n")
print("## LSP servers")
print("\n")
for _, value in pairs(lsp_servers()) do
    print(string.format("- %s", value))
end
print("\n")
