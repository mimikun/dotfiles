---@type oops.config
local opts = {
    force = false,
    ignore_kinds = { "input", "expr" },
    rules = {
        q_quote = {
            condition = function(prompt, command)
                if prompt ~= "cmd" then
                    return
                end

                return string.match(command, "^q[`'\"]") ~= nil
            end,

            fix = function(prompt, command)
                return prompt, string.gsub(command, "^q[`'\"]", "q")
            end,
        },
    },
}

return opts
