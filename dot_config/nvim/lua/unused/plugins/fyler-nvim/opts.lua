---@type FylerConfig
local opts = {
    default_explorer = false,

    ---@type string "mini-icons" | "nvim-web-devicons"
    icon_provider = "nvim-web-devicons",

    -- Controls whether to show git status or not
    git_status = true,
}

return opts
