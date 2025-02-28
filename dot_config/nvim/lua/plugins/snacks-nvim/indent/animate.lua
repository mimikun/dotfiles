-- animate scopes. Enabled by default for Neovim >= 0.10
-- Works on older versions but has to trigger redraws during animation.
---@class snacks.indent.animate: snacks.animate.Config
---@field enabled? boolean
--- * out: animate outwards from the cursor
--- * up: animate upwards from the cursor
--- * down: animate downwards from the cursor
--- * up_down: animate up or down based on the cursor position
---@field style? "out"|"up_down"|"down"|"up"
local Animate = {
    enabled = vim.fn.has("nvim-0.10") == 1,
    style = "out",
    easing = "linear",
    duration = {
        -- ms per step
        step = 20,
        -- maximum duration
        total = 500,
    },
}

return Animate
