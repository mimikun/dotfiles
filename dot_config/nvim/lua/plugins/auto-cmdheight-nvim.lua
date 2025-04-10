---@type table
local opts = {
    -- max cmdheight before displaying hit enter prompt.
    max_lines = 5,
    -- number of seconds until the cmdheight can restore.
    duration = 2,
    -- whether key press is required to restore cmdheight.
    remove_on_key = true,
}

---@type LazySpec
local spec = {
    "jake-stewart/auto-cmdheight.nvim",
    lazy = false,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
