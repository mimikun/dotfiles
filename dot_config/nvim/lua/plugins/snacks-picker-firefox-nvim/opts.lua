---@type table
local opts = {
    -- MacOS: 'open'
    -- Windows: 'start firefox' or 'explorer'
    url_open_command = "xdg-open",
    -- MacOS: "Library/Application Support/Firefox"
    -- Windows: "Appdata/Roaming/Mozilla/Firefox"
    firefox_profile_dir = "~/.mozilla/firefox",
    firefox_profile_glob = "*.default*",
}

return opts
