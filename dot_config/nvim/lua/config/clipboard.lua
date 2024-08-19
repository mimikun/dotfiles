local M = {}

---@type table
M.xsel = {
    name = "xsel-clipboard",
    copy = {
        ["+"] = "xsel -bi",
        ["*"] = "xsel -bi",
    },
    paste = {
        ["+"] = "xsel -bo",
        ["*"] = function()
            return vim.fn.systemlist('xsel -bo | tr -d "\r"')
        end,
    },
    cache_enabled = true,
}

---@type table
M.osc52 = {
    name = "osc52-clipboard",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
}

--- NOTE: WSL2 only
--- NOTE: require human rights
--- Use wl-clipboard https://github.com/bugaevc/wl-clipboard
---@type table
M.wl_clipboard = {
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

--- ref: https://minerva.mamansoft.net/Notes/%F0%9F%93%95WSL2%E3%81%AENeovim%E3%82%92Windows%E3%81%AE%E3%82%AF%E3%83%AA%E3%83%83%E3%83%97%E3%83%9C%E3%83%BC%E3%83%89%E3%81%A8%E5%90%8C%E6%9C%9F#%E3%82%84%E3%82%8A%E6%96%B92
---@type table
M.wl_clipboard_2 = {
    name = "wl-clipboard-2",
    copy = {
        ["+"] = "wl-copy",
    },
    paste = {
        ["+"] = function()
            return vim.fn.systemlist('wl-paste | tr -d "\r"')
        end,
        ["*"] = "wl-paste",
    },
    cache_enabled = true,
}

---@type table
M.tmux_clipboard = {
    name = "tmux-clipboard",
    copy = {
        ["+"] = { "tmux", "load-buffer", "-" },
        ["*"] = { "tmux", "load-buffer", "-" },
    },
    paste = {
        ["+"] = { "tmux", "save-buffer", "-" },
        ["*"] = { "tmux", "save-buffer", "-" },
    },
    cache_enabled = true,
}

---@type table
M.wsl_clip_exe = {
    name = "wsl-clip-exe",
    copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
    },
    paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
}

return M
