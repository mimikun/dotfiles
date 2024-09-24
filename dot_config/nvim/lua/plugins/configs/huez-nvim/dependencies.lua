---@type LazySpec[]
local dependencies = {}

---@type LazySpec[]
local main = {
    -- main colorscheme
    "pauchiner/pastelnight.nvim",
    -- sub colorscheme
    "folke/tokyonight.nvim",
    "projekt0n/github-nvim-theme",
}

---@type LazySpec[]
local other = {
    { "Mofiqul/vscode.nvim", optional = true },
    { "qaptoR-nvim/chocolatier.nvim", optional = true },
    { "paulo-granthon/hyper.nvim", optional = true },
    { "aliqyan-21/darkvoid.nvim", optional = true },
    { "sainnhe/edge", optional = true },
    { "eldritch-theme/eldritch.nvim", optional = true },
    { "scottmckendry/cyberdream.nvim", optional = true },
    { "sekke276/dark_flat.nvim", optional = true },
    { "comfysage/evergarden", optional = true },
    { "0xstepit/flow.nvim", optional = true },
    { "maxmx03/fluoromachine.nvim", optional = true },
    { "high-moctane/gaming.vim", optional = true },
    { "sho-87/kanagawa-paper.nvim", optional = true },
    { "rebelot/kanagawa.nvim", optional = true },
    { "shrikecode/kyotonight.vim", optional = true },
    { "slugbyte/lackluster.nvim", optional = true },
    { "marko-cerovac/material.nvim", optional = true },
    { "mellow-theme/mellow.nvim", optional = true },
    { "tanvirtin/monokai.nvim", optional = true },
    { "loctvl842/monokai-pro.nvim", optional = true },
    { "rafamadriz/neon", optional = true },
    { "2giosangmitom/nightfall.nvim", optional = true },
    { "EdenEast/nightfox.nvim", optional = true },
    { "shaunsingh/nord.nvim", optional = true },
    { "dgox16/oldworld.nvim", optional = true },
    { "Allianaab2m/penumbra.nvim", optional = true },
    { "sainnhe/sonokai", optional = true },
    { "NTBBloodbath/sweetie.nvim", optional = true },
    { "tiagovla/tokyodark.nvim", optional = true },
    { "sontungexpt/witch", optional = true },
    { "yorik1984/newpaper.nvim", optional = true },
    -- 'named' colorscheme
    { "catppuccin/nvim", name = "catppuccin", optional = true },
    { "Everblush/nvim", name = "everblush", optional = true },
    -- need other dependencies
    { "asperan/chstr.nvim", dependencies = { "rktjmp/lush.nvim" }, optional = true },
    { "b0o/lavi.nvim", dependencies = { "rktjmp/lush.nvim" }, optional = true },
    -- other dependencies
    { "rktjmp/lush.nvim", optional = true },
    { "Iron-E/nvim-highlite", optional = true },
    { "loganswartz/polychrome.nvim", optional = true },
}

if require("config.settings").need_all_colorschemes then
    dependencies = vim.tbl_extend("keep", main, other)
else
    dependencies = main
end

return dependencies
