-- NOTE: need [im-select](https://github.com/daipeihust/im-select) for macOS/Windows
-- NOTE: need [ibus](https://github.com/ibus/ibus) for Linux
-- NOTE: [macism](https://github.com/laishulu/macism) can be a better choice over im-select for macOS.

---@type LazySpec
local spec = {
    "amekusa/auto-input-switch.nvim",
    --lazy = false,
    cmd = require("plugins.auto-input-switch-nvim.cmds"),
    opts = require("plugins.auto-input-switch-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
