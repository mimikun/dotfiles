---@type TutorialOptions
local opts = {
    enabled = false,
    ignored_buffers = {
        "nofile",
        "quickfix",
        "help",
        "prompt",
        "popup",
    },
}

---@type LazySpec
local spec = {
    "Hashino/tutorial.nvim",
    --lazy = false,
    cmd = "Tutorial",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
