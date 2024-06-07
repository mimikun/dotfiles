-- TODO:

---@type LazySpec
local spec = {
    "delphinus/obsidian-kensaku.nvim",
    cmd = "ObsidianKensaku",
    opts = require("core.global").is_human_rights and {} or {
        query_filter = "cmigemo",
        cmigemo_executable = "/bin/cmigemo",
        --migemo_dict_path = "/path/to/migemo-dict",
    },
    --cond = false,
}

return spec
