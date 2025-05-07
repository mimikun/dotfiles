---@type table
local logos = {
    buruaka = {
        koyuki = {
            nande = require("plugins.snacks-nvim.dashboard.logos.buruaka.koyuki_nande"),
        },
    },
    covid_19 = {
        en_ja = require("plugins.snacks-nvim.dashboard.logos.covid_19.en_ja"),
    },
    neovim = {
        rich = require("plugins.snacks-nvim.dashboard.logos.neovim.rich"),
        simple = require("plugins.snacks-nvim.dashboard.logos.neovim.simple"),
    },
    vanitas = {
        aa = require("plugins.snacks-nvim.dashboard.logos.vanitas.aa"),
        one = require("plugins.snacks-nvim.dashboard.logos.vanitas.one"),
        two = require("plugins.snacks-nvim.dashboard.logos.vanitas.two"),
    },
}

---@type table
local headers = {
    home = logos.buruaka.koyuki.nande,
    work = logos.neovim.rich,
}

---@type string
local header = require("config.global").is_work and headers.work or headers.home

return header
