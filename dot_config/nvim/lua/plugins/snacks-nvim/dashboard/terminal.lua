---@type table
local fallback = {
    img_path = vim.fn.expand("~/.kabegami/banitasu.png"),
    logo_aa = require("plugins.snacks-nvim.dashboard.logos.neovim.gaming"),
}

---@type table
local tte_subcommands = {
    "middleout --center-movement-speed 0.8 --full-movement-speed 0.2",
    "slide --merge --movement-speed 0.8",
    "beams --beam-delay 5 --beam-row-speed-range 20-60 --beam-column-speed-range 8-12",
}
math.randomseed(os.time())
local subcommand = tte_subcommands[math.random(#tte_subcommands)]

local M = {}

-- gaming animation logo
---@param logo_aa string
---@return table # animation logo_aa
M.gaming_aa = function(logo_aa)
    -- nil check
    if logo_aa == nil then
        print("No logo provided")
        logo_aa = fallback.logo_aa
    end

    -- trim
    local safe_logo = vim.fn.shellescape(vim.trim(logo_aa))

    ---@type table
    return {
        section = "terminal",
        cmd = {
            "sh",
            "-c",
            ""
                .. "sleep 0.5 && "
                .. "printf '%s' "
                .. safe_logo
                .. " | tte --anchor-canvas s "
                .. subcommand
                .. " --final-gradient-direction diagonal"
                .. " && sleep 1",
        },
    }
end

-- chafa rendering image
---@param img_path string
---@return table # chafa rendered image
M.show_image = function(img_path)
    -- path check
    if img_path == nil or img_path == "" then
        print("No image path provided")
        img_path = fallback.img_path
    end

    ---@type table
    return {
        section = "terminal",
        cmd = "chafa " .. img_path .. " ; sleep 10",
    }
end

return M
