---@type screenkey.config
local opts = {
    disable = {
        filetypes = { "toggleterm" },
        buftypes = { "terminal" },
        events = false,
    },
}

---@type LazySpec
local spec = {
    "NStefan002/screenkey.nvim",
    -- NOTE: There is no need to lazy load Screenkey, it lazy loads by default.
    lazy = false,
    cmd = "Screenkey",
    opts = opts,
    --cond = false,
}

return spec
