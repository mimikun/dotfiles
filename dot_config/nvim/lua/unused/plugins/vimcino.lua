---@type table
local cmds = {
    "Vimcino",
    "VimcinoStats",
}

---@type vimcino.Config
local opts = {
    stats = { file_loc = "/custom/file/location" },
    blackjack = {
        number_of_decks = 1,
    },
}

---@type LazySpec
local spec = {
    "steveslatky/vimcino",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
