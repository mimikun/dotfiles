---@type table
local need_servers = {}

---@type table
local base_servers = {
    "bashls",
    "cssls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "luau_lsp",
    "marksman",
    "powershell_es",
    "pyright",
    "rust_analyzer",
    "taplo",
    "ts_ls",
    "typos_lsp",
    "vimls",
    "yamlls",
}

---@type table
local not_windows = {
    "markdown_oxide",
}

---@type table
local addisional_servers = {
    others = {
        "clangd",
        "efm",
        "graphql",
        "neocmake",
        "zls",
    },
    not_windows = {
        "csharp_ls",
        "esbonio",
        "gopls",
        "jqls",
        "nil_ls",
        "solargraph",
    },
}

---@type table
need_servers = vim.list_extend(need_servers, base_servers)

-- NOTE: Include some langservers, NOT Windows
if not require("config.global").is_windows then
    ---@type table
    need_servers = vim.list_extend(need_servers, not_windows)
    if require("config.settings").need_all_servers then
        ---@type table
        need_servers = vim.list_extend(need_servers, addisional_servers.not_windows)
    end
end

-- NOTE: Include some langservers, if need_all_servers set TRUE
if require("config.settings").need_all_servers then
    ---@type table
    need_servers = vim.list_extend(need_servers, addisional_servers.others)
end

table.sort(need_servers)

return need_servers
