---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    --"nvim-telescope/telescope-frecency.nvim",
    "danielfalk/smart-open.nvim",
    --"rcarriga/nvim-notify",
    --"ghassan0/telescope-glyph.nvim",
    --"xiyaowong/telescope-emoji.nvim",
    --"tsakirist/telescope-lazy.nvim",
    --"fdschmidt93/telescope-egrepify.nvim",
    --"nvim-telescope/telescope-file-browser.nvim",
    --"vuki656/package-info.nvim",
    --"tiagovla/scope.nvim",
    --"nvim-lua/popup.nvim",
    --"jvgrootveld/telescope-zoxide",
    --"debugloop/telescope-undo.nvim",
    --"epwalsh/pomo.nvim",
    --"GianniBYoung/chezmoi-telescope.nvim",
    --"roycrippen4/telescope-treesitter-info.nvim",
    --"illia-shkroba/telescope-completion.nvim",
    --"cljoly/telescope-repo.nvim",
    --"cbochs/grapple.nvim",
    --"kdheepak/lazygit.nvim",
    --"folke/noice.nvim",
    --"nvimdev/template.nvim",
    --"stevearc/aerial.nvim",
    --"2KAbhishek/octohub.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(dependencies, { "nvim-telescope/telescope-fzf-native.nvim", build = "make" })
    --table.insert(dependencies, { "dharmx/telescope-media.nvim" })
end

return dependencies
