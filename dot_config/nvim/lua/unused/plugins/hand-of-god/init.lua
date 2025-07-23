local opts = require("plugins.hand-of-god.opts")

---@type LazySpec
local spec = {
    "alucherdi/hand-of-god",
    --lazy = false,
    keys = require("plugins.hand-of-god.keys"),
    event = "VeryLazy",
    config = function()
        require("handofgod.jumper").setup()
        require("handofgod.manager"):setup(opts.manager)
        require("handofgod.searcher"):setup(opts.searcher)
        require("handofgod.finder").setup()
    end,
    cond = false,
    enabled = false,
}

return spec
