---@type table
local per_filetype = {
    markdown = {
        "emoji",
        "nerdfont",
    },
    org = { "orgmode" },
    -- NOTE: blink-compat sources
    ["dap-repl"] = { "dap" },
    dapui_watches = { "dap" },
    dapui_hover = { "dap" },
    go = { "go_deep" },
}

return per_filetype
