---@type table
local opts = {
    delay = 200,
    stop_key = "<Esc>",
    initial_delay = 0,
    final_delay = 0,
    scroll_margin = 5,
    top_margin = 0,
}

---@type LazySpec
local spec = {
    "walkingshamrock/slowreader.nvim",
    --lazy = false,
    cmd = "SlowRead",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
