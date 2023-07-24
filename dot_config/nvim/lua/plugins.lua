vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- fern.vim
    use({ "lambdalisue/fern.vim", branch = "main" })
    use("lambdalisue/fern-git-status.vim")
    use("lambdalisue/nerdfont.vim")
    use("lambdalisue/fern-renderer-nerdfont.vim")
    use("lambdalisue/glyph-palette.vim")

    -- fzf.vim
    use("junegunn/fzf.vim")

    -- nvim treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("IndianBoy42/tree-sitter-just")

    -- coc.nvim
    use({ "neoclide/coc.nvim", branch = "release" })

    -- syntax hilights
    use("preservim/vim-markdown")
    use("imsnif/kdl.vim")
    use("cespare/vim-toml")
    use("NoahTheDuke/vim-just")
    use("nastevens/vim-cargo-make")
    use("alker0/chezmoi.vim")

    -- utilities
    use("mattn/calendar-vim")
    use("vim-jp/vimdoc-ja")
    use("nastevens/vim-duckscript")
    use("thinca/vim-scouter")
    use("thinca/vim-quickrun")
    use("airblade/vim-gitgutter")
    use("godlygeek/tabular")
    use("dstein64/vim-startuptime")
    use({
        "kode-team/mastodon.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "rcarriga/nvim-notify",
            "kkharji/sqlite.lua",
        },
        config = function()
            require("mastodon").setup()
        end,
    })
    use({
        "jackMort/ChatGPT.nvim",
        -- March 6th 2023, before submit issue
        commit = "8820b99c",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({
            })
        end,
    })
    use({
        "alanfortlink/blackjack.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("vim-skk/skkeleton")
    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    })

    ---- denops.vim
    use("vim-denops/denops.vim")
    use("lambdalisue/gin.vim")
    --use("skanehira/denops-twihi.vim")
    use("skanehira/denops-docker.vim")
    use("willelz/skk-tutorial.vim")
    use("Omochice/dps-translate-vim")

    -- color theme
    use({
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({})
            vim.cmd("colorscheme github_dark")
        end,
    })

    -- status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- other color theme
    use("tanvirtin/monokai.nvim")
    use("Allianaab2m/penumbra.nvim")
    use("folke/tokyonight.nvim")
end)
