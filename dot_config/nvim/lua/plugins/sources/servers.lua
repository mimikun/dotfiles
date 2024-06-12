local M = {}

---@type table
local base_servers = {
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
if not require("core.global").is_windows then
    table.insert(base_servers, "csharp_ls")
    table.insert(base_servers, "gopls")
    table.insert(base_servers, "jqls")
    table.insert(base_servers, "esbonio")
    table.insert(base_servers, "solargraph")
    table.insert(base_servers, "markdown_oxide")
end

M.need_servers = base_servers

return M
