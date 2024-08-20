---@type table
local cmds = {
    "HauntTerm",
    "HauntHelp",
    "HauntMan",
    "HauntLs",
    "HauntReset",
}

---@type LazySpec
local spec = {
    "adigitoleo/haunt.nvim",
    -- NOTE: official repository
    --url = "https://git.sr.ht/~adigitoleo/haunt.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    --cond = false,
}

return spec
