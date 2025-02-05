---@type CordConfig
local opts = {
    buttons = {
        {
            label = function(opts)
                return opts.repo_url and "View Repository"
            end,
            url = function(opts)
                return opts.repo_url or "NONE"
            end,
        },
    },
    plugins = {
        ["cord.plugins.diagnostics"] = {},
        ["cord.plugins.scoped_timestamps"] = {
            scope = "workspace",
            pause = true,
        },
    },
}

return opts
