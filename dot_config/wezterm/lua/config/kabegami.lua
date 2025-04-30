local global = require("config.global")

---@type table
local kabegami = {
    butasan = {
        nesoberi = "butasan_nesoberi.png",
    },
    azusa = {
        kuroinu = "Azusa_by_96ENU.png",
        sentariba = "azusa_by_sentariba.png",
    },
}

local kabegami_name = kabegami.azusa.kuroinu
local kabegami_path = table.concat({ global.home, ".kabegami", "random", kabegami_name }, global.path_sep)

local function kabegami(config)
    if global.is_human_rights then
        config.window_background_image = kabegami_path
        config.window_background_image_hsb = {
            hue = 1.0,
            saturation = 1.0,
            brightness = 0.07,
        }
    end
end

return kabegami
