---@type LazySpec
local spec = {
    "RRethy/vim-illuminate",
    --lazy = false,
    cmd = require("plugins.vim-illuminate.cmds"),
    config = function()
        require("illuminate").configure(require("plugins.vim-illuminate.opts"))
    end,
    --cond = false,
    --enabled = false,
}

return spec
