---@type table
local opts = {
    ft_overrides = {
        lua = {
            associated_filetypes = { ".lua", ".tl" },
            enclosure_pairs = {
                ["'"] = "'",
                ['"'] = '"',
                ["[["] = "]]",
            },
            includeexpr = "substitute(v:fname,'\\.\\w*','','')",
        },
    },
}

return opts
