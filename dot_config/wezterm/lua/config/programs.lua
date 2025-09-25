local g = require("config.global")

local function programs(config)
    if not g.is_azusa then
        -- NOTE: If human rights violation, PowerShell takes 2 min to start.
        config.default_prog = { "pwsh.exe", "-NoProfile" }
    end
end

return programs
