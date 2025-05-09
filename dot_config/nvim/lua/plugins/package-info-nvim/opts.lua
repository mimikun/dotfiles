-- Can be `npm`, `yarn`, or `pnpm`
---@type string
local use_pm = "pnpm"

---@type table
local opts = {
    colors = {
        up_to_date = "#3C4048",
        outdated = "#d19a66",
    },
    icons = {
        enable = true,
        style = {
            up_to_date = "|  ",
            outdated = "|  ",
        },
    },
    autostart = true,
    package_manager = use_pm,
    hide_up_to_date = false,
    hide_unstable_versions = false,
}

return opts
