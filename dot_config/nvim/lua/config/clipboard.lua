local is_wsl = require("config.global").is_wsl

-- clipboard.lua
if is_wsl then
    vim.g.clipboard = {
        name = "wl-clipboard",
        copy = {
            ["+"] = { "wl-copy", "--type", "text/plain" },
            ["*"] = { "wl-copy", "--primary", "--type", "text/plain" },
        },
        paste = {
            ["+"] = { "wl-paste", "--no-newline" },
            ["*"] = { "wl-paste", "--no-newline", "--primary" },
        },
        cache_enabled = true,
    }
end
