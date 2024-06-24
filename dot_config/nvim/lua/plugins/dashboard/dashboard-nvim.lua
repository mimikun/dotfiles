---@type table
local cmds = {
    "Dashboard",
    "DbProjectDelete",
    "DashboardUpdateFooter",
}

---@type table
local config = {
    hyper = {
        header = nil,
        week_header = {
            enable = false,
            concat = nil,
            append = nil,
        },
        disable_move = false,
    },
    doom = {
        header = nil,
        week_header = {
            enable = false,
            concat = nil,
            append = nil,
        },
        disable_move = false,
    },
}

---@type table
local opts = {
    theme = "hyper",
    disable_move = false,
    shortcut_type = "number",
    change_to_vcs_root = false,
    config = config.hyper,
    hide = {
        statusline = true,
        tabline = true,
    },
    preview = {
        command = "",
        file_path = nil,
        file_height = 0,
        file_width = 0,
    },
}

---@type LazySpec
local spec = {
    "nvimdev/dashboard-nvim",
    lazy = false,
    cmd = cmds,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = opts,
    config = function(_, opts)
        require("dashboard").setup(opts)
    end,
    cond = false,
}

return spec
