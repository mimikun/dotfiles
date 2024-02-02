-- thx: https://coralpink.github.io/commentary/neovim/lsp/nvim-lspconfig.html
local keymaps = {
    { "<space>e", desc = "vim.diagnostic.open_float" },
    { "[d", desc = "vim.diagnostic.goto_prev" },
    { "]d", desc = "vim.diagnostic.goto_next" },
    { "<space>q", desc = "vim.diagnostic.setloclist" },
    { "gD", desc = "vim.lsp.buf.declaration" },
    { "gd", desc = "vim.lsp.buf.definition" },
    { "K", desc = "vim.lsp.buf.hover" },
    { "gi", desc = "vim.lsp.buf.implementation" },
    { "<C-k>", desc = "vim.lsp.buf.signature_help" },
    { "<space>wa", desc = "vim.lsp.buf.add_workspace_folder" },
    { "<space>wr", desc = "vim.lsp.buf.remove_workspace_folder" },
    { "<space>wl", desc = "vim.inspect(vim.lsp.buf.list_workspace_folders())" },
    { "<space>D", desc = "vim.lsp.buf.type_definition" },
    { "<space>rn", desc = "vim.lsp.buf.rename" },
    { "<space>ca", desc = "vim.lsp.buf.code_action" },
    { "gr", desc = "vim.lsp.buf.references" },
    { "<space>f", desc = "vim.lsp.buf.format({ async = true })" },
}

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = keymaps,
    config = function()
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end,
        })
    end,
    --cond = false,
}
