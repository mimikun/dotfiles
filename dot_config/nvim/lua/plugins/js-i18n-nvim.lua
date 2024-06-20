---@type table
local cmds = {
    "I18nSetLang",
    "I18nVirtualTextEnable",
    "I18nVirtualTextDisable",
    "I18nVirtualTextToggle",
}

---@type table
local dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
}

---@type table
local opts = {
    primary_language = {},
    translation_source = { "**/locales/*/translation.json" },
    --detect_language = nil
    key_separator = ".",
    virt_text = {
        enabled = true,
        conceal_key = false,
        fallback = false,
        max_length = 0,
    },
}

---@type LazySpec
local spec = {
    "nabekou29/js-i18n.nvim",
    --lazy = false,
    cmd = cmds,
    event = "LspAttach",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
