local global = require("config.global")

local script_path_base = table.concat({ "scripts", "start_server." }, global.path_sep)

---@type FastSpellSettings
local opts = {
    namespace = "fastspell",
    server_code_path = debug.getinfo(1).source:sub(2):gsub("fastspell.lua", "")
        .. (global.is_windows and script_path_base .. "cmd" or script_path_base .. "sh"),
    filter_by_buf_type = true,
    --diagnostic_severity = vim.diagnostic.severity.INFO,
    --cspell_json_file_path = nil,
}

return opts
