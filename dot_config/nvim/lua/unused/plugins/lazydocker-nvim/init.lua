local KEYS = require("plugins.lazydocker-nvim.keys")
local OPTS = require("plugins.lazydocker-nvim.opts")

---@type LazySpec[]
local SPEC = {
    ---@type LazySpec
    crnvl96 = {
        "crnvl96/lazydocker.nvim",
        --lazy = false,
        keys = KEYS.crnvl96,
        opts = OPTS.crnvl96,
        cond = false,
        enabled = false,
    },
    ---@type LazySpec
    mgierada = {
        "mgierada/lazydocker.nvim",
        --lazy = false,
        --cmd = "CMDNAME",
        keys = KEYS.mgierada,
        event = "BufRead",
        dependencies = { "akinsho/toggleterm.nvim" },
        opts = OPTS.mgierada,
        cond = false,
        enabled = false,
    },
}

return SPEC.crnvl96
