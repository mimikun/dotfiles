---@type LazyKeysSpec[]
local keys = {
    -- Global mappings
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    {
        "<space>e",
        function()
            vim.diagnostic.open_float()
        end,
        mode = "n",
        desc = "Show diagnostics in a floating window",
    },
    {
        "[d",
        function()
            vim.diagnostic.jump({ count = -1, float = true })
        end,
        mode = "n",
        desc = "Move to a prev diagnostic",
    },
    {
        "]d",
        function()
            vim.diagnostic.jump({ count = 1, float = true })
        end,
        mode = "n",
        desc = "Move to a next diagnostic",
    },
    {
        "<space>q",
        function()
            vim.diagnostic.setloclist()
        end,
        mode = "n",
        desc = "Add buffer diagnostics to the location list",
    },

    -- Buffer local mappings
    { "gD", desc = "Jumps to the declaration of the symbol under the cursor" },
    { "gd", desc = "Jumps to the definition of the symbol under the cursor" },
    { "K", desc = "Displays hover information about the symbol under the cursor in a floating window" },
    { "gi", desc = "Lists all the implementations for the symbol under the cursor in the quickfix window" },
    { "<C-k>", desc = "Displays signature information about the symbol under the cursor in a floating window" },
    { "<space>wa", desc = "Add the folder at path to the workspace folders" },
    { "<space>wr", desc = "Remove the folder at path from the workspace folders" },
    { "<space>wl", desc = "Gets a human-readable representation of the given object( List workspace folders )" },
    { "<space>D", desc = "Jumps to the definition of the type of the symbol under the cursor" },
    { "<space>rn", desc = "Renames all references to the symbol under the cursor" },
    { "<space>ca", desc = "Selects a code action available at the current cursor position" },
    { "gr", desc = "Lists all the references to the symbol under the cursor in the quickfix window" },
    -- TODO: fix dup keys
    { "<space>f", desc = "Formats a buffer using the attached (and optionally filtered) language server clients" },
}

---@type LazySpec[]
local dependencies = {
    "nvimdev/lspsaga.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "neovim/nvim-lspconfig",
    --lazy = false,
    keys = keys,
    dependencies = dependencies,
    config = function()
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            --group = vim.api.nvim_create_augroup("UserLspConfig", {}),
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

return spec
