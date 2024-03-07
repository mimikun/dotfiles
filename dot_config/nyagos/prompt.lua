-- Prompt
nyagos.env["STARSHIP_DURATION"] = "0"

nyagos.preexechook = function()
    nyagos.env["STARSHIP_START_TIME"] = tostring(os.time())
end

nyagos.postexechook = function()
    nyagos.env["STARSHIP_END_TIME"] = tostring(os.time())
    nyagos.env["STARSHIP_DURATION"] =
        tostring(1000 * (tonumber(nyagos.env["STARSHIP_END_TIME"]) - tonumber(nyagos.env["STARSHIP_START_TIME"])))
end

-- prompt
nyagos.prompt = function()
    local duration
    local prompt = ""
    if nyagos.which("starship") then
        duration = tonumber(nyagos.env["STARSHIP_DURATION"])
        if duration > 0 then
            prompt = prompt
                .. nyagos.eval(
                    "starship prompt --status="
                        .. nyagos.env["ERRORLEVEL"]
                        .. " --cmd-duration="
                        .. nyagos.env["STARSHIP_DURATION"]
                )
                .. "$e[37;1m"
                .. " "
        else
            prompt = prompt .. nyagos.eval("starship prompt --status=" .. nyagos.env["ERRORLEVEL"]) .. "$e[37;1m" .. " "
        end
    end

    return nyagos.default_prompt(prompt)
end
