---@type table
local need_servers = {
    "bashls",
    "clangd",
    "cssls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "efm",
    "eslint",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "luau_lsp",
    "marksman",
    "neocmake",
    "powershell_es",
    "pyright",
    "rust_analyzer",
    "taplo",
    "ts_ls",
    "typos_lsp",
    "vimls",
    "yamlls",
    "zls",
}

-- NOTE: Include some langservers
if not require("config.global").is_windows then
    table.insert(need_servers, "csharp_ls")
    table.insert(need_servers, "esbonio")
    table.insert(need_servers, "gopls")
    table.insert(need_servers, "jqls")
    table.insert(need_servers, "markdown_oxide")
    table.insert(need_servers, "nil_ls")
    table.insert(need_servers, "solargraph")
end

return need_servers
