local clipboard = {}

clipboard.SAMPLE = {
    name = "SAMPLE",
    copy = {
        ["+"] = { "echo", "nil" },
        ["*"] = { "echo", "nil" },
    },
    paste = {
        ["+"] = { "echo", "nil" },
        ["*"] = { "echo", "nil" },
    },
    cache_enabled = true or false,
}

clipboard.wl_clipboard = {
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

clipboard.win32yank = {
    name = "win32yank",
    copy = {
        ["+"] = { "win32yank", " -i ", "--crlf" },
        ["*"] = { "win32yank", " -i ", "--crlf" },
    },
    paste = {
        ["+"] = { "win32yank", "-o ", "--lf" },
        ["*"] = { "win32yank", "-o ", "--lf" },
    },
    cache_enabled = false,
}

clipboard.tmux = {
    name = "tmux",
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

clipboard.windows = {
    name = "windows",
    copy = {
        ["+"] = { "clip.exe" },
        ["*"] = { "clip.exe" },
    },
    paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
}

return clipboard
