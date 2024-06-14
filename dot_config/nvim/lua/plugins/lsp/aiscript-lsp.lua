local M = {
    default_config = {
        root_dir = require("lspconfig").util.root_pattern("*.is", "*.ais"),
        name = "aiscript-lsp",
        filetypes = { "is", "ais" },
        autostart = true,
        single_file_support = true,
        --on_new_config = function(new_config, new_root_dir) end,
        --capabilities = {},
        cmd = { "aiscript-languageserver", "--stdio" },
        --handlers = {},
        --init_options = {},
        --on_attach = function(client, bufnr)end,
        settings = {},
    },
}

return M
