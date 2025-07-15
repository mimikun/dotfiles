---@type LazySpec
local spec = {
    "adigitoleo/haunt.nvim",
    -- NOTE: official repository
    --url = "https://git.sr.ht/~adigitoleo/haunt.nvim",
    --lazy = false,
    cmd = require("plugins.haunt-nvim.cmds"),
    opts = require("plugins.haunt-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
