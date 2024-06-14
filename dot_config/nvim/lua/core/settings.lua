local settings = {}

---Set to use ai assistant
--- NOTE: work: it's a JTC
--- NOTE: home: very poor
---@type boolean
settings["use_ai_assistant"] = false

---Set to use denops
--- NOTE: require human rights
---@type boolean
settings["use_denops"] = false

---Set theme switcher
--- NOTE: huez.nvim is beta
---@type string
settings["use_theme_switcher"] = "themery"

---Set to use dark power
---Enable ddu, ddc, and more
---NOTE: require human rights and `use_denops = true`
---@type boolean
settings["use_dark_power"] = false

return settings
