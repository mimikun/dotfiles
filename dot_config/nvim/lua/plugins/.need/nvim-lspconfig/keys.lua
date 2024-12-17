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
    { "<space>f", desc = "Formats a buffer using the attached (and optionally filtered) language server clients" },
}

return keys
