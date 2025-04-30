local g = require("config.global")

local function programs(config)
    if not g.is_azusa then
        if g.is_human_rights then
            config.default_domain = "WSL:Ubuntu"
        else
            -- NOTE: If human rights violation, PowerShell takes 2 min to start.
            config.default_prog = { "pwsh.exe", "-NoProfile" }
        end
    end
end

return programs
