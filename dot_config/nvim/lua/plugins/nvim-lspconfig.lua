---@type table
local keys = {
    { "<space>e", desc = "vim.diagnostic.open_float" },
    { "[d", desc = "vim.diagnostic.goto_prev" },
    { "]d", desc = "vim.diagnostic.goto_next" },
    { "<space>q", desc = "vim.diagnostic.setloclist" },
    { "gD", desc = "vim.lsp.buf.declaration" },
    { "gd", desc = "vim.lsp.buf.definition" },
    { "K", desc = "vim.lsp.buf.hover" },
    { "gi", desc = "vim.lsp.buf.implementation" },
    { "<C-k>", desc = "vim.lsp.buf.signature_help" },
    { "<space>wa", desc = "vim.lsp.buf.add_workspace_folder" },
    { "<space>wr", desc = "vim.lsp.buf.remove_workspace_folder" },
    { "<space>wl", desc = "vim.inspect(vim.lsp.buf.list_workspace_folders())" },
    { "<space>D", desc = "vim.lsp.buf.type_definition" },
    { "<space>rn", desc = "vim.lsp.buf.rename" },
    { "<space>ca", desc = "vim.lsp.buf.code_action" },
    { "gr", desc = "vim.lsp.buf.references" },
    { "<space>f", desc = "vim.lsp.buf.format({ async = true })" },
}

---@type table
local dependencies = {
    "nvimdev/lspsaga.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = keys,
    dependencies = dependencies,
    config = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({
            -- https://nvimdev.github.io/lspsaga/misc/
            ui = {
                border = "rounded",
                devicon = true,
                foldericon = true,
                title = true,
                -- TODO: Use utils/icons.lua
                expand = "⊞",
                collapse = "⊟",
                code_action = "💡",
                actionfix = " ",
                lines = { "┗", "┣", "┃", "━", "┏" },
                kind = nil,
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
        })
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end,
        })
    end,
    --cond = false,
}

return spec
