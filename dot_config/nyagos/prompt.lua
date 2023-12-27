---@diagnostic disable:duplicate-set-field
-- Prompt
nyagos.prompt = function(this)
    local prompt = ""
    if nyagos.which("starship") then
        prompt = prompt .. nyagos.eval("starship prompt 2> nul") .. "$e[37;1m" .. " "
        return nyagos.default_prompt(prompt, "")
    end
    return nyagos.default_prompt("$e[49;36;1m" .. this .. "$e[37;1m", "")
end
