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
        { "fancy_branch" },
        { "fancy_diff", source = diff_source },
    },
    lualine_c = {
        -- NOTE: filename component has bug
        -- https://github.com/nvim-lualine/lualine.nvim/issues/1097
        -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
        { "filename", file_status = true },
        {
            "fancy_diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
        },
        { "navic" },
    },
    lualine_x = {
        { "fancy_filetype", ts_icon = require("utils.icons").get("misc").Tree },
        improved_encoding,
        "fileformat",
    },
    lualine_y = { "progress" },
    lualine_z = {
        { "fancy_location", color = { gui = "bold" } },
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
tabline = {}

---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type table
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "meuter/lualine-so-fancy.nvim",
    "SmiteshP/nvim-navic",
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
    event = events,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
