---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    {
        "MaximilianLloyd/ascii.nvim",
        optional = true,
    },
    {
        "MunifTanjim/nui.nvim",
        optional = true,
    },
    {
        "nhattVim/alpha-ascii.nvim",
        cmd = {
            "AlphaAsciiNext",
            "AlphaAsciiPrev",
            "AlphaAsciiRandom",
            "AlphaAsciiName",
        },
        opts = {
            header = "random",
        },
        optional = true,
    },
}

return dependencies
