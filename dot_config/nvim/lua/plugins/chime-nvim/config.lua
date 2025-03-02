---@type table
local config = {
    chime = {
        severity_sort = false,
        severity = nil,
        format = function(diagnostic)
            local severity_text = vim.diagnostic.severity[diagnostic.severity]
            local severity_color = ({
                "DiagnosticError",
                "DiagnosticWarn",
                "DiagnosticInfo",
                "DiagnosticHint",
            })[diagnostic.severity]

            return {
                { ("[%s] "):format(severity_text), severity_color },
                -- prevent "Press enter" prompts by only showing first line
                { vim.split(diagnostic.message, "\n")[1] },
                { (" (%s)"):format(diagnostic.source), "Comment" },
            }
        end,
    },
}

return config
