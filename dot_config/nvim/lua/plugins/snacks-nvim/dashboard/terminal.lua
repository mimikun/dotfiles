local use_dashboard_image = false

local img_path = vim.fn.expand("~/.kabegami/banitasu.png")

---@type table
local M = {}

-- banitasu image
---@type table
local banitasu_image = {
    section = "terminal",
    cmd = "chafa " .. img_path .. " ; sleep 10",
}

-- low performance env
local limited_env = {}

---@type table
local tte_subcommands = {
    "middleout --center-movement-speed 0.8 --full-movement-speed 0.2",
    "slide --merge --movement-speed 0.8",
    "beams --beam-delay 5 --beam-row-speed-range 20-60 --beam-column-speed-range 8-12",
}
math.randomseed(os.time())
local subcommand = tte_subcommands[math.random(#tte_subcommands)]

local neovim_logo = require("plugins.snacks-nvim.dashboard.header").get("logo").Neovim_gaming

-- gaming animation logo
---@type table
local gaming_logo = {
    section = "terminal",
    cmd = {
        "sh",
        "-c",
        "echo -e "
            .. vim.fn.shellescape(vim.trim(neovim_logo))
            .. " | tte --anchor-canvas s "
            .. subcommand
            .. " --final-gradient-direction diagonal",
    },
}

if use_dashboard_image then
    --M = banitasu_image
    M = gaming_logo
else
    M = limited_env
end

return M
