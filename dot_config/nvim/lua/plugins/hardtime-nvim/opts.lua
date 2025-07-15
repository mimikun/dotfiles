---@type string "block" | "hint"
local restriction_mode = "block"

---@type table
local opts = {
    enabled = true,
    force_exit_insert_mode = false,
    max_insert_idle_ms = 5000,
    restriction_mode = restriction_mode,
}

return opts
