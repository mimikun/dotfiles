---@type table
local dashboard_image = require("plugins.snacks-nvim.dashboard.terminal")

---@type table
local sections = {}

table.insert(sections, {
    section = "header",
})
table.insert(sections, dashboard_image)
table.insert(sections, {
    pane = 2,
    section = "keys",
    gap = 1,
    padding = 1,
})
table.insert(sections, {
    section = "startup",
})

return sections
