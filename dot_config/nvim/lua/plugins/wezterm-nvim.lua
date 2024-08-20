---@type boolean
local dev = true

---@type wezterm.Config
local opts = {
    create_commands = true,
}

if dev then
    table.insert(opts, { exe_name = "winwezterm" })
end

---@type LazySpec
local spec = {
    "willothy/wezterm.nvim",
    dev = dev,
    --lazy = false,
    cmd = "WeztermSpawn",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
