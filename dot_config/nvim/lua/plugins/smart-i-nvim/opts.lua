---@type table
local opts = {
    -- Global settings (defaults)
    enable_i = true,
    enable_I = true,
    enable_a = true,
    enable_A = true,

    -- Filetype-specific settings
    ft_config = {
        -- Disable 'i' and 'I' mappings for markdown files
        markdown = {
            enable_i = false,
            enable_I = false,
        },
        -- Disable all mappings for help files
        help = {
            enable_i = false,
            enable_I = false,
            enable_a = false,
            enable_A = false,
        },
        -- You can add settings for other filetypes here
        -- lua = {
        --   enable_a = false,
        -- }
    },
}

return opts
