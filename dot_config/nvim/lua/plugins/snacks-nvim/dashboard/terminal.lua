local use_dashboard_image = false

local img_path = vim.fn.expand("~/.kabegami/banitasu.png")

---@type table
local M = {}

local banitasu_image = {
    section = "terminal",
    --cmd = "chafa " .. img_path .. " --symbols vhalf; sleep 10",
    cmd = "chafa " .. img_path .. " ; sleep 10",
}

local limited_env = {}

if use_dashboard_image then
    M = banitasu_image
else
    M = limited_env
end

return M
