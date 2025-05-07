local g = require("config.global")

---@type boolean
local use_dashboard_image = require("config.settings").use_dashboard_image
use_dashboard_image = false

---@type string
local image_path = vim.fn.expand("~/.kabegami/banitasu.png")
---@type string
local gaming_logo = require("plugins.snacks-nvim.dashboard.logos.buruaka.koyuki_face")

local gaming_aa = require("plugins.snacks-nvim.dashboard.terminal").gaming_aa
local show_image = require("plugins.snacks-nvim.dashboard.terminal").show_image

---@type table
local sections = {}

table.insert(sections, {
    section = "header",
})
if g.is_human_rights and g.is_home then
    if use_dashboard_image then
        table.insert(sections, show_image(image_path))
    else
        table.insert(sections, gaming_aa(gaming_logo))
    end
end
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
