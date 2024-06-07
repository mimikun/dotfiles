local iconsets = require("utils.icons")
local diagnostics = iconsets.get("diagnostics", true)
local git = iconsets.get("git")

---@type table
local icon = {
    error = diagnostics.Error,
    warn = diagnostics.Warning,
    info = diagnostics.Information,
    hint = diagnostics.Hint,
    branch = git.Branch,
    add = git.Add,
    mod = git.Mod_alt,
    remove = git.Remove,
}

---@return string
local function improved_encoding()
    local encoding = vim.opt.fileencoding:get()
    if encoding == "utf-8" then
        encoding = "UTF-8"
    elseif encoding == "cp932" then
        encoding = "SHIFT-JIS"
    elseif encoding == "euc-jp" then
        encoding = "EUC-JP"
    else
        encoding = encoding
    end
    return encoding
end

---@return string
local function special_notice()
    return "コロナを忘れるな！"
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

---@type table
local options = {
    theme = "auto",
    component_separators = "",
    section_separators = "",
    icons_enabled = true,
    globalstatus = true,
    refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
    },
}

---@type table
local sections = {
    lualine_a = {
        { "mode", color = { gui = "bold" } },
    },
    lualine_b = {
        { "b:gitsigns_head", icon = icon.branch },
        { "diff", symbols = { added = icon.add, modified = icon.mod, removed = icon.remove }, source = diff_source },
    },
    lualine_c = {
        -- NOTE: filename component has bug
        -- https://github.com/nvim-lualine/lualine.nvim/issues/1097
        -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
        { "filename", file_status = true },
        {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = icon.error, warn = icon.warn, info = icon.info, hint = icon.hint },
        },
    },
    lualine_x = {
        "filetype",
        improved_encoding,
        "fileformat",
    },
    lualine_y = { "progress" },
    lualine_z = {
        { "location", color = { gui = "bold" } },
    },
}

---@type table
local tabline = {
    lualine_a = {
        {
            "buffers",
            buffers_color = {
                active = "lualine_b_normal",
            },
        },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { special_notice },
    lualine_z = {
        {
            "tabs",
            tabs_color = {
                active = "lualine_b_normal",
            },
        },
    },
}

---@type table
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
}

---@type table
local opts = {
    options = options,
    sections = sections,
    tabline = tabline,
}

---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies,
    config = function()
        require("lualine").setup(opts)
    end,
    --cond = false,
}

return spec
