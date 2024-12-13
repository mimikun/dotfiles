---@type EcologConfig
local opts = {
    integrations = {
        lsp = true,
        lspsaga = true,
    },
    shelter = {
        configuration = {
            partial_mode = false,
            mask_char = "*",
        },
        modules = {
            cmp = true,
            peek = false,
            files = false,
            telescope = false,
        },
    },
}

return opts
