---@type LazySpec
local spec = {
    "s-show/extend_word_motion.nvim",
    --lazy = false,
    event = "BufEnter",
    dependencies = { "sirasagi62/tinysegmenter.nvim" },
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
