-- thx: https://raw.githubusercontent.com/numToStr/dotfiles/master/neovim/.config/nvim/lua/numToStr/plugins/lualine.lua

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

local sections = {
    lualine_a = {
        {
            "mode",
            color = {
                gui = "bold",
            },
        },
    },
    lualine_b = {
        {
            "branch",
        },
        {
            "diff",
            colored = false,
        },
    },
    lualine_c = {
        {
            -- NOTE: filename component has bug
            -- https://github.com/nvim-lualine/lualine.nvim/issues/1097
            -- NOTE: filename component document
            -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
            "filename",
            file_status = true,
            path = function()
                local file = vim.fn.expand("%:p")
                if vim.fn.filereadable(file) == 1 then
                    return 0
                else
                    return 0
                end
            end,
        },
        {
            "diagnostics",
        },
    },
    lualine_x = {
        "filetype",
        "encoding",
        "fileformat",
    },
    lualine_y = {
        "progress",
    },
    lualine_z = {
        {
            "location",
            color = {
                gui = "bold",
            },
        },
    },
}

local tabline = {
    lualine_a = {
        {
            "buffers",
            buffers_color = {
                active = "lualine_b_normal",
            },
        },
    },
    lualine_z = {
        {
            "tabs",
            tabs_color = {
                active = "lualine_b_normal",
            },
        },
    },
}

local opts = {
    options = options,
    sections = sections,
    tabline = tabline,
}

return {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
    },
    config = function()
        require("lualine").setup(opts)
    end,
    --cond = false,
}
