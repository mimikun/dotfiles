---@type table
local dependencies = {
    "roobert/surround-ui.nvim",
    "folke/which-key.nvim",
}

---@type table
local surround_opts = {
    -- Defines plugin keymaps
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
    },
    -- Defines surround keys and behavior
    --surrounds = {},
    -- Defines aliases
    aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    -- Defines highlight behavior
    --highlight = {},
    -- Defines cursor behavior
    --move_cursor = {},
    -- Defines line indentation behavior
    indent_lines = function(start, stop)
        local b = vim.bo
        -- Only re-indent the selection if a formatter is set up already
        if start < stop and (b.equalprg ~= "" or b.indentexpr ~= "" or b.cindent or b.smartindent or b.lisp) then
            vim.cmd(string.format("silent normal! %dG=%dG", start, stop))
        end
    end,
}

---@type table
local surround_ui_opts = {
    root_key = "S",
}

---@type LazySpec
local spec = {
    "kylechui/nvim-surround",
    version = "*",
    lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("nvim-surround").setup(surround_opts)
        require("surround-ui").setup(surround_ui_opts)
    end,
    --cond = false,
}

return spec
