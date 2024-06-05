---@type table
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    -- https://nvimdev.github.io/lspsaga/misc/
    ui = {
        border = "rounded",
        devicon = true,
        foldericon = true,
        title = true,
        -- TODO: Use icons
        expand = "⊞",
        -- TODO: Use icons
        collapse = "⊟",
        -- TODO: Use icons
        code_action = "💡",
        -- TODO: Use icons
        actionfix = " ",
        -- TODO: Use icons
        lines = { "┗", "┣", "┃", "━", "┏" },
        kind = nil,
        -- TODO: Use icons
        imp_sign = "󰳛 ",
    },
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    beacon = {
        enable = true,
        frequency = 7,
    },
    -- https://nvimdev.github.io/lspsaga/rename/
    rename = {
        in_select = true,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,
        keys = {
            quit = "<C-k>",
            exec = "<CR>",
            select = "x",
        },
    },
    -- https://nvimdev.github.io/lspsaga/outline/
    outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = true,
        detail = true,
        auto_close = true,
        close_after_jump = false,
        layout = "normal",
        max_height = 0.5,
        left_width = 0.3,
        keys = {
            toggle_or_jump = "o",
            quit = "q",
            jump = "e",
        },
    },
    -- https://nvimdev.github.io/lspsaga/lightbulb/
    lightbulb = {
        enable = true,
        sign = true,
        debounce = 10,
        sign_priority = 40,
        virtual_text = true,
        --enable_in_insert = true,
    },
    -- https://nvimdev.github.io/lspsaga/implement/
    implement = {
        enable = false,
        sign = true,
        lang = {},
        virtual_text = true,
        priority = 100,
    },
    -- https://nvimdev.github.io/lspsaga/hover/
    hover = {
        max_width = 0.9,
        max_height = 0.8,
        open_link = "gx",
        -- TODO: custom
        -- open_cmd = "!chrome",
    },
    -- https://nvimdev.github.io/lspsaga/floaterm/
    floaterm = {
        height = 0.7,
        width = 0.7,
    },
    -- https://nvimdev.github.io/lspsaga/finder/
    finder = {
        max_height = 0.5,
        left_width = 0.4,
        methods = {},
        default = "ref+imp",
        layout = "float",
        silent = false,
        filter = {},
        fname_sub = nil,
        sp_inexist = false,
        sp_global = false,
        ly_botright = false,
        keys = {
            shuttle = "[w",
            toggle_or_open = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            tabnew = "r",
            quit = "q",
            close = "<C-c>k",
        },
    },
    -- https://nvimdev.github.io/lspsaga/diagnostic/
    diagnostic = {
        show_code_action = true,
        show_layout = "float",
        show_normal_height = 10,
        jump_num_shortcut = true,
        max_width = 0.8,
        max_height = 0.6,
        max_show_width = 0.9,
        max_show_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        wrap_long_lines = true,
        extend_relatedInformation = false,
        diagnostic_only_current = false,
        keys = {
            exec_action = "o",
            quit = "q",
            toggle_or_jump = "<CR>",
            quit_in_show = { "q", "<ESC>" },
        },
    },
    -- https://nvimdev.github.io/lspsaga/definition/
    definition = {
        width = 0.6,
        height = 0.5,
        save_pos = false,
        keys = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>i",
            tabe = "<C-c>t",
            tabnew = "<C-c>n",
            quit = "q",
            close = "<C-c>k",
        },
    },
    -- https://nvimdev.github.io/lspsaga/codeaction/
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = false,
        only_in_cursor = true,
        max_height = 0.3,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },
    -- https://nvimdev.github.io/lspsaga/callhierarchy/
    callhierarchy = {
        layout = "float",
        left_width = 0.2,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            close = "<C-c>k",
            quit = "q",
            shuttle = "[w",
            toggle_or_req = "u",
        },
    },
    -- https://nvimdev.github.io/lspsaga/breadcrumbs/
    symbol_in_winbar = {
        enable = true,
        separator = " › ",
        hide_keyword = false,
        ignore_patterns = nil,
        show_file = true,
        folder_level = 1,
        color_mode = true,
        dely = 300,
    },
    -- Unknown
    request_timeout = 2000,
}

---@type LazySpec
local spec = {
    "nvimdev/lspsaga.nvim",
    --lazy = false,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
