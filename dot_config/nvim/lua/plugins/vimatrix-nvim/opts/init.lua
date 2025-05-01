---@type table
local colourschemes = require("plugins.vimatrix-nvim.opts.colourschemes")

---@type vx.config
local opts = {
    auto_activation = require("plugins.vimatrix-nvim.opts.auto_activation"),
    window = require("plugins.vimatrix-nvim.opts.window"),
    droplet = require("plugins.vimatrix-nvim.opts.droplet"),
    colourscheme = colourschemes.matrix,
    alphabet = require("plugins.vimatrix-nvim.opts.alphabet"),
}

return opts
