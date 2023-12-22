local global = require("core.global")
local path_sep = global.path_sep
local data_dir = global.data_dir
-- ref: https://github.com/folke/lazy.nvim/issues/1220
---@diagnostic disable
local build_cmd = function()
    local tags_ja = data_dir .. "lazy" .. path_sep .. "vimdoc-ja" .. path_sep .. "doc" .. path_sep .. "tags-ja"
    return "git update-index --skip-worktree" .. tags_ja
end

return {
    "mimikun/vimdoc-ja",
    branch = "fixed",
    --"vim-jp/vimdoc-ja",
    --build = build_cmd,
    --lazy = false,
    --event = "VeryLazy",
    keys = {
        { "h", mode = "c", desc = "open [H]elp" },
    },
    --cond = false,
}
