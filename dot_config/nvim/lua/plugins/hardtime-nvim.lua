---@type string "block" | "hint"
local restriction_mode = "block"

---@type table
local opts = {
    enabled = true,
    force_exit_insert_mode = false,
    max_insert_idle_ms = 5000,
    restriction_mode = restriction_mode,
}

---@type LazySpec
local spec = {
    "m4xshen/hardtime.nvim",
    lazy = false,
    cmd = "Hardtime",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
