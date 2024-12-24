---@type EcologConfig
local opts = {
    integrations = {
        lsp = true,
        lspsaga = true,
        blink_cmp = true,
        nvim_cmp = true,
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
