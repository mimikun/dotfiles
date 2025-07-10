---@type table
local opts = {
    adapters = {
        require("quicktest.adapters.golang")({}),
        require("quicktest.adapters.vitest")({}),
        require("quicktest.adapters.playwright")({}),
        require("quicktest.adapters.elixir"),
        require("quicktest.adapters.criterion"),
        require("quicktest.adapters.dart"),
    },
    default_win_mode = "split",
    use_builtin_colorizer = true,
}

return opts
