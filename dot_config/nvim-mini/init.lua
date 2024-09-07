-- global
if vim.loader then
    vim.loader.enable()
end

local os_name = vim.uv.os_uname().sysname

---@type boolean
local is_mac = os_name == "Darwin"

---@type boolean
local is_linux = os_name == "Linux"

---@type boolean
local is_windows = os_name == "Windows_NT"

---@type boolean
local is_wsl = vim.fn.has("wsl") == 1

---@type boolean
local is_unix = vim.fn.has("unix") == 1

---@type string
local path_sep = is_windows and "\\" or "/"

-- options
vim.opt.mouse = "a"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.fileencodings = { "utf-8", "cp932", "ucs-bombs", "euc-jp" }
vim.opt.swapfile = false
vim.opt.hidden = is_unix
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }
vim.opt.smartindent = true
vim.opt.visualbell = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.updatetime = 250
vim.opt.helplang = { "ja", "en" }
vim.g.editorconfig = true
vim.cmd("syntax enable")
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("", "<Esc><Esc>", ":nohlsearch<CR><Esc>")

-- clipboard integration
vim.opt.clipboard = "unnamedplus"
if is_wsl then
    vim.g.clipboard = {
        name = "xsel-clipboard",
        copy = {
            ["+"] = "xsel -bi",
            ["*"] = "xsel -bi",
        },
        paste = {
            ["+"] = "xsel -bo",
            ["*"] = function()
                return vim.fn.systemlist('xsel -bo | tr -d "\r"')
            end,
        },
        cache_enabled = true,
    }
end

-- mini.nvim setup
local path_package = table.concat({ vim.fn.stdpath("data"), "site" }, path_sep)
local mini_path = table.concat({ path_package, "pack", "deps", "start", "mini.nvim" }, path_sep)
if not vim.uv.fs_stat(mini_path) then
    vim.notify("Installing mini.nvim...")
    vim.cmd.redraw()
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    })
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.notify("Installed mini.nvim")
    vim.cmd.redraw()
end

-- mini.deps(plugin manager) setup
require("mini.deps").setup({
    job = {
        -- When I used the human rights violation machine,
        -- was 4, so I'll cut it in half and make it 2.
        n_threads = 4,
    },
    path = { package = path_package },
})

-- add some plugins
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add("Mofiqul/vscode.nvim")
    vim.cmd.colorscheme("vscode")
end)

now(function()
    require("mini.files").setup()
    vim.keymap.set("n", "<C-n>", function()
        MiniFiles.open()
    end, { silent = true })
end)

now(function()
    require("mini.icons").setup()
end)

now(function()
    require("mini.notify").setup()
end)

now(function()
    local quick_links = "Quick Links"
    local starter = require("mini.starter")
    starter.setup({
        header = table.concat(require("bannars").get("covid_19").Japan, "\n"),
        items = {
            { name = "e  󰝒  New file", action = "enew", section = quick_links },
            { name = "u  󰚰  Update plugins", action = "DepsUpdate", section = quick_links },
            { name = "t  󰐅  Update nvim-treesitter", action = "TSUpdate", section = quick_links },
            { name = "c  󰿶  Run checkhealth", action = "checkhealth", section = quick_links },
            { name = "q  󰅚  Quit", action = "qa", section = quick_links },
        },
        content_hooks = {
            starter.gen_hook.aligning("center", "center"),
        },
        footer = "",
    })
end)

now(function()
    require("mini.statusline").setup()
end)

now(function()
    require("mini.tabline").setup()
end)

-- Lazy loading
later(function()
    add({
        source = "nvim-treesitter/nvim-treesitter",
        checkout = "master",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vimdoc" },
        highlight = { enable = true },
        sync_install = true,
    })
end)

later(function()
    add({
        source = "adigitoleo/haunt.nvim",
        --source = "https://git.sr.ht/~adigitoleo/haunt.nvim",
    })
    require("haunt").setup({
        quit_help_with_q = true,
        window = {
            width_frac = 0.88,
            height_frac = 0.88,
            winblend = 15,
        },
    })
end)

later(function()
    require("mini.animate").setup()
end)

later(function()
    require("mini.comment").setup()
end)

later(function()
    -- Helpful mappings
    -- `<Tab>` and `<S-Tab>`
    local imap_expr = function(lhs, rhs)
        vim.keymap.set("i", lhs, rhs, { expr = true })
    end

    imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
    imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

    local keycode = vim.keycode
        or function(x)
            return vim.api.nvim_replace_termcodes(x, true, true, true)
        end

    local keys = {
        ["cr"] = keycode("<CR>"),
        ["ctrl-y"] = keycode("<C-y>"),
        ["ctrl-y_cr"] = keycode("<C-y><CR>"),
    }

    _G.cr_action = function()
        if vim.fn.pumvisible() ~= 0 then
            -- If popup is visible, confirm selected item or add new line otherwise
            local item_selected = vim.fn.complete_info()["selected"] ~= -1
            return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
        else
            -- If popup is not visible, use plain `<CR>`. You might want to customize
            -- according to other plugins. For example, to use 'mini.pairs', replace
            -- next line with `return require('mini.pairs').cr()`
            return keys["cr"]
        end
    end

    vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })

    require("mini.completion").setup()
end)

later(function()
    require("mini.cursorword").setup()
end)

later(function()
    require("mini.diff").setup()
end)

later(function()
    require("mini.extra").setup()
end)

later(function()
    require("mini.fuzzy").setup()
end)

later(function()
    require("mini.git").setup()
end)

later(function()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
        highlighters = {
            fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
            hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
            todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
            note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end)

later(function()
    require("mini.indentscope").setup()
end)

later(function()
    local jump2d = require("mini.jump2d")
    jump2d.setup({
        view = {
            dim = true,
        },
        mappings = {
            start_jumping = "",
        },
    })

    -- Custom mapping
    vim.keymap.set("n", "<leader>h", function()
        jump2d.start(jump2d.builtin_opts.default)
    end, { silent = true })
end)

later(function()
    require("mini.misc").setup()
end)

later(function()
    require("mini.pairs").setup()
end)

later(function()
    require("mini.pick").setup()
end)

later(function()
    require("mini.surround").setup()
end)

later(function()
    require("mini.test").setup()
end)

later(function()
    require("mini.trailspace").setup()
end)

later(function()
    require("mini.visits").setup()
end)
