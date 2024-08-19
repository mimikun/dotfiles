---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
}

---@type LazySpec
local spec = {
    "goolord/alpha-nvim",
    --lazy = false,
    cmd = "Alpha",
    event = "VimEnter",
    dependencies = dependencies,
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local button = require("alpha.themes.dashboard").button

        theta.header.val = require("utils.bannars").get("covid_19").Japan
        theta.buttons.val = {
            { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            button("e", "󰝒  New file", "<cmd>ene<CR>"),
            button("f", "󰱼  File search", "<cmd>Telescope smart_open<CR>"),
            button("r", "󰋚  Show MRU", "<cmd>Telescope oldfiles<CR>"),
            button(".", "󰏇  Run oil", "<cmd>Oil<CR>"),
            button("u", "󰚰  Update plugins", "<cmd>Lazy sync<CR>"),
            button("m", "󰭠  Update mason plugins", "<cmd>Mason<CR>"),
            button("t", "󰐅  Update nvim-treesitter", "<cmd>TSUpdate<CR>"),
            button("c", "󰿶  Run checkhealth", "<cmd>checkhealth<CR>"),
            button("d", "󰝒  Run dotfyle generate", "<cmd>DotfyleGenerate --keymaps<CR>"),
            button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }

        theta.config.layout = {
            { type = "padding", val = 2 },
            theta.header,
            { type = "padding", val = 2 },
            theta.buttons,
        }

        alpha.setup(theta.config)
    end,
    --cond = false,
}

return spec
