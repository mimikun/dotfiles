---@type table
local fish_lsp_root_files = {
    "config.fish",
    "$HOME/.config/fish",
    "/usr/share/fish",
}

-- NOTE: about :h lspconfig-setup
-- NOTE: ref: https://github.com/ndonfris/fish-lsp/issues/22
local M = {
    default_config = {
        root_dir = function(fname)
            local root_files = require("lspconfig").util.root_pattern(unpack(fish_lsp_root_files))(fname)
            return root_files
        end,
        name = "fish-lsp",
        filetypes = { "fish" },
        autostart = true,
        single_file_support = true,
        --on_new_config = function(new_config, new_root_dir) end,
        --capabilities = {},
        cmd = { "fish-lsp", "start" },
        --handlers = {},
        --init_options = {},
        --on_attach = function(client, bufnr)end,
        settings = {},
    },
}

return M
