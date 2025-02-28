---@class snacks.image.convert.Config
local Convert = {
    -- show a notification on error
    notify = true,
    ---@type snacks.image.args
    mermaid = function()
        local theme = vim.o.background == "light" and "neutral" or "dark"
        return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
    end,
    ---@type table<string,snacks.image.args>
    magick = {
        default = { "{src}[0]", "-scale", "1920x1080>" },
        math = { "-density", 600, "{src}[0]", "-trim" },
        pdf = { "-density", 300, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
    },
}

return Convert
