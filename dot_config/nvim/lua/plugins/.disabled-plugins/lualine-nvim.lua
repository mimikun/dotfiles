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

---@return table
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

---@return string
local function special_notice()
    local special_msg = "コロナを忘れるな！"
    return special_msg
end

---@type
local disabled_filetypes = {
    statusline = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
    winbar = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
}

---@type table
local options = {
    theme = "auto",
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = disabled_filetypes,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
}

---@type table
local sections = {
    lualine_a = {
        "mode",
    },
    lualine_b = {
        {
            "filename",
            newfile_status = true,
            path = 1,
            shorting_target = 24,
            symbols = { modified = "_󰷥", readonly = " ", newfile = "󰄛" },
        },
    },
    lualine_c = {
        {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = "" },
        },
        { "navic" },
    },
    lualine_x = {
        improved_encoding,
        { "diff", symbols = { added = " ", modified = " ", removed = " " }, source = diff_source },
    },
    lualine_y = {
        "filetype",
    },
    lualine_z = {
        { "fileformat", icons_enabled = true, separator = { left = "", right = "" } },
    },
}

---@type table
local tabline = {
    lualine_a = {
        -- TODO: bufferline plugin
        --[[
        {
            "buffers",
            symbols = { modified = "_󰷥", alternate_file = " ", directory = " " },
        },
        ]]
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
        "diff",
    },
    lualine_y = {
        "branch",
    },
    lualine_z = {
        "tabs",
    },
}

---@type table
local winbar = {
    lualine_a = {},
    lualine_b = { special_notice },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
}

---@type table
local opts = {
    options = options,
    sections = sections,
    -- TODO: bufferline/tabline plugin
    --tabline = tabline,
    tabline = {},
    -- TODO: winbar plugin
    --winbar = winbar,
    winbar = {},
}

---@type table
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "SmiteshP/nvim-navic",
}

---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = "BufEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
