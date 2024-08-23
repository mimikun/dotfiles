---@type table
local cmds = {
    "HauntTerm",
    "HauntHelp",
    "HauntMan",
    "HauntLs",
    "HauntReset",
}

---@type table
local opts = {
    quit_help_with_q = true,
    window = {
        width_frac = 0.88,
        height_frac = 0.88,
        winblend = 15,
    },
}

---@type LazySpec
local spec = {
    "adigitoleo/haunt.nvim",
    -- NOTE: official repository
    --url = "https://git.sr.ht/~adigitoleo/haunt.nvim",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
