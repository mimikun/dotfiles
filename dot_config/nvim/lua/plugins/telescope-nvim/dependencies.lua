---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    --"nvim-telescope/telescope-frecency.nvim",
    "danielfalk/smart-open.nvim",
    "gbprod/yanky.nvim",
    "philosofonusus/ecolog.nvim",
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
    "roycrippen4/telescope-treesitter-info.nvim",
    --"illia-shkroba/telescope-completion.nvim",
    --"cljoly/telescope-repo.nvim",
    --"cbochs/grapple.nvim",
    --"kdheepak/lazygit.nvim",
    --"folke/noice.nvim",
    --"nvimdev/template.nvim",
    --"stevearc/aerial.nvim",
    --"2KAbhishek/octohub.nvim",
    --"nvim-telescope/telescope-live-grep-args.nvim",
    --"nvim-orgmode/orgmode",
    --"nvim-orgmode/telescope-orgmode.nvim",
    --"janwvjaarsveld/neovimcraft.nvim",
    --"wsdjeg/mru.nvim",
    --"wsdjeg/rooter.nvim",
    --{ "yetone/avante.nvim", optional = true },
    --"oleksiiluchnikov/telescope-avante.nvim",
    --"oleksiiluchnikov/telescope-prompts.nvim",
    --"ThePrimeagen/refactoring.nvim",
    --{ "2kabhishek/nerdy.nvim", optional = true },
    --"piersolenski/telescope-import.nvim",
    "kiyoon/telescope-insert-path.nvim",
    --"happy663/telescope-livegrep-history.nvim",
    --{ "milanglacier/yarepl.nvim", optional = true },
    --{ "nosduco/remote-sshfs.nvim", optional = true },
    --{ "unwarlikepoodle/telescope-git-recent.nvim", optional = true },
    --{ "nvim-flutter/flutter-tools.nvim", optional = true },
    "MunifTanjim/nui.nvim",
    "MaximilianLloyd/ascii.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(dependencies, { "nvim-telescope/telescope-fzf-native.nvim", build = "make" })
    --table.insert(dependencies, { "mimikun/telescope-media.nvim" })
    table.insert(dependencies, { "nvim-telescope/telescope-media-files.nvim" })
end

return dependencies
