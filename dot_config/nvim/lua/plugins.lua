local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer itself
    use({ "wbthomason/packer.nvim" })

    -- fern.vim
    use({ "lambdalisue/fern.vim", branch = "main" })
    use({ "lambdalisue/fern-git-status.vim" })
    use({ "lambdalisue/nerdfont.vim" })
    use({ "lambdalisue/fern-renderer-nerdfont.vim" })
    use({ "lambdalisue/glyph-palette.vim" })

    -- fzf.vim
    use({
        "junegunn/fzf.vim",
        requires = {
            { "junegunn/fzf" },
        },
    })

    -- nvim treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "IndianBoy42/tree-sitter-just" })

    -- coc.nvim
    use({ "neoclide/coc.nvim", branch = "release" })

    -- syntax hilights
    use({ "imsnif/kdl.vim" })
    use({ "NoahTheDuke/vim-just" })
    use({ "alker0/chezmoi.vim" })
    use({
        "preservim/vim-markdown",
        requires = {
            { "godlygeek/tabular" },
        },
    })
    use({
        "nastevens/vim-cargo-make",
        requires = {
            { "cespare/vim-toml" },
            { "nastevens/vim-duckscript" },
        },
    })

    -- utilities
    use({ "mattn/calendar-vim" })
    use({ "vim-jp/vimdoc-ja" })
    use({ "thinca/vim-scouter" })
    use({ "thinca/vim-quickrun" })
    use({ "airblade/vim-gitgutter" })
    use({ "dstein64/vim-startuptime" })
    use({
        "kode-team/mastodon.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "rcarriga/nvim-notify" },
            { "kkharji/sqlite.lua" },
        },
        config = function()
            require("mastodon").setup({})
        end,
    })
    use({
        "jackMort/ChatGPT.nvim",
        -- March 6th 2023, before submit issue
        commit = "8820b99c",
        requires = {
            { "MunifTanjim/nui.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
    })
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end,
    })
    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    })

    ---- denops.vim
    use({ "vim-denops/denops.vim" })
    use({ "lambdalisue/gin.vim" })
    use({ "skanehira/denops-docker.vim" })
    use({ "willelz/skk-tutorial.vim" })
    use({ "Omochice/dps-translate-vim" })
    use({ "vim-skk/skkeleton" })

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
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    -- other color theme
    use({ "tanvirtin/monokai.nvim" })
    use({ "Allianaab2m/penumbra.nvim" })
    use({ "folke/tokyonight.nvim" })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
