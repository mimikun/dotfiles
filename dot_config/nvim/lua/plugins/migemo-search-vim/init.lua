-- HACK: disable temporary
---@type string
--local cmigemo_bin = require("config.global").is_windows and "cmigemo.exe" or "cmigemo"

--- If executable cmigemo command
--local enabled = require("utils").is_executable({ cmigemo_bin })
local enabled = false

---@type LazySpec
local spec = {
    "rhysd/migemo-search.vim",
    --lazy = false,
    keys = require("plugins.migemo-search-vim.keys"),
    config = function()
        vim.cmd([[cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"]])
    end,
    cond = enabled,
    enabled = enabled,
}

return spec
