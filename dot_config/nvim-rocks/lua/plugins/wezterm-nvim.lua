---@type boolean
local dev = false

---@type wezterm.Config
local opts = {
    create_commands = true,
}

if dev then
    table.insert(opts, { exe_name = "winwezterm" })
end

require("wezterm").setup(opts)
