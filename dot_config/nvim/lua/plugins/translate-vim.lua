-- Disable if there are human rights
---@type boolean
local is_not_human_rights = not require("config.global").is_human_rights

---@type LazySpec
local spec = {
    "skanehira/translate.vim",
    --lazy = false,
    cmd = "Translate",
    config = function()
        vim.g.translate_source = "en"
        vim.g.translate_target = "ja"
    end,
    cond = is_not_human_rights,
    enabled = is_not_human_rights,
}

return spec
