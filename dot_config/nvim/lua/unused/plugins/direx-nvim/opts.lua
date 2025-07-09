---@type table
local opts = {
    -- Use Direx as the default plugin for opening directories. Default: `true`
    ---@type boolean
    default = true,
    ---@type table
    grep = {
        parse_args = "shell",
        timeout = nil,
    },
    iconfunc = function(path)
        if path:sub(-1) == "/" then
            return { icon = " ", hl = "Directory" }
        else
            return { icon = "󰈔 ", hl = "Normal" }
        end
    end,
}

return opts
