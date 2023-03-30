vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- status line
    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    --use 'rcabralc/monokai-airline.vim'
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- fern.vim
    use({ "lambdalisue/fern.vim", branch = "main" })
    use("lambdalisue/fern-git-status.vim")
    use("lambdalisue/nerdfont.vim")
    use("lambdalisue/fern-renderer-nerdfont.vim")
    use("lambdalisue/glyph-palette.vim")

    -- fzf.vim
    use({
        "junegunn/fzf",
        run = function()
            vim.fn["fzf#install()"](0)
        end,
    })
    use("junegunn/fzf.vim")

    -- nvim treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("IndianBoy42/tree-sitter-just")

    -- coc.nvim
    use({ "neoclide/coc.nvim", branch = "release" })
    use({
        "pappasam/coc-jedi",
        branch = "main",
        run = "yarn install --frozen-lockfile && yarn build",
    })

    -- color theme
    use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
    use("tanvirtin/monokai.nvim")
    use("Allianaab2m/penumbra.nvim")

    -- syntax hilights
    use("preservim/vim-markdown")
    use("imsnif/kdl.vim")
    use("cespare/vim-toml")
    use("NoahTheDuke/vim-just")
    use("nastevens/vim-cargo-make")
    use("alker0/chezmoi.vim")
    --use("lukas-reineke/indent-blankline.nvim")

    -- utilities
    use("mattn/calendar-vim")
    use("vim-jp/vimdoc-ja")
    use("nastevens/vim-duckscript")
    use("thinca/vim-scouter")
    use("Omochice/dps-translate-vim")
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
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })
    use("alec-gibson/nvim-tetris")

    ---- denops.vim
    use("vim-denops/denops.vim")
    use("lambdalisue/gin.vim")
end)
