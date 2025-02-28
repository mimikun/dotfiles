---@class snacks.scroll.Config
---@field animate snacks.animate.Config|{}
---@field animate_repeat snacks.animate.Config|{}|{delay:number}
local Config = {
    enabled = false,
    animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
    },
    -- faster animation when repeating scroll after delay
    animate_repeat = {
        -- delay in ms before using the repeat animation
        delay = 100,
        duration = { step = 5, total = 50 },
        easing = "linear",
    },
    -- what buffers to animate
    filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
    end,
}

return Config
