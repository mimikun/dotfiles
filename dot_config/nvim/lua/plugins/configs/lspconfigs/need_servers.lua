---@type table
local need_servers = {
    "lua_ls",
    "marksman",
    "efm",
    "jsonls",
    "typos_lsp",
    "bashls",
    "clangd",
    "neocmake",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "graphql",
    "html",
    "tsserver",
    "luau_lsp",
    "powershell_es",
    "pyright",
    "rust_analyzer",
    "taplo",
    "vimls",
    "yamlls",
    "zls",
}

-- NOTE: Include csharp_ls, gopls, jqls, esbonio, markdown_oxide
if not require("config.global").is_windows then
    table.insert(need_servers, "csharp_ls")
    table.insert(need_servers, "gopls")
    table.insert(need_servers, "jqls")
    table.insert(need_servers, "esbonio")
    table.insert(need_servers, "solargraph")
    table.insert(need_servers, "markdown_oxide")
end

return need_servers
