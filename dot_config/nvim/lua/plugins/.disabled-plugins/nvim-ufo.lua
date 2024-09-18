---@type LazyKeysSpec[]
local keys = {
    {
        "zR",
        mode = "n",
        desc = "openAllFolds",
    },
    {
        "zM",
        mode = "n",
        desc = "closeAllFolds",
    },
}

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-ufo",
    --lazy = false,
    --cmd = "CMDNAME",
    keys = keys,
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
        -- '0' is not bad
        vim.o.foldcolumn = "1"
        -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
    end,
    config = function()
        local ufo = require("ufo")
        -- Option 2: nvim lsp as LSP client
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        for _, ls in ipairs(language_servers) do
            require("lspconfig")[ls].setup({
                capabilities = capabilities,
                -- you can add other fields for setting up lsp server in this table
            })
        end

        ufo.setup({
            --[[
            -- Option 3: treesitter as a main provider instead
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
            ]]
        })

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set("n", "zR", ufo.openAllFolds)
        vim.keymap.set("n", "zM", ufo.closeAllFolds)
    end,
    cond = false,
    enabled = false,
}

return spec
