local M = {}

---@type table
local lsp_servers = {
    "lua_ls",
    "marksman",
    "efm",
    "jsonls",
    "typos_lsp",
    "bashls",
    "clangd",
    "csharp_ls",
    "neocmake",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "gopls",
    "graphql",
    "html",
    "tsserver",
    "jqls",
    "luau_lsp",
    "markdown_oxide",
    "powershell_es",
    "pyright",
    "solargraph",
    "rust_analyzer",
    "esbonio",
    "taplo",
    "vimls",
    "yamlls",
    "zls",
}

if require("config.global").is_windows then
    -- Windows
    -- NOTE: Exclude csharp_ls, gopls, jqls, esbonio, markdown_oxide
    for i, v in ipairs(lsp_servers) do
        if
            (v == "csharp_ls")
            or (v == "gopls")
            or (v == "jqls")
            or (v == "esbonio")
            or (v == "solargraph")
            or (v == "markdown_oxide")
        then
            table.remove(lsp_servers, i)
        end
    end
end

M.servers = lsp_servers

return M
