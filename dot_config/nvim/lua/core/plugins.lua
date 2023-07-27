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
    use({
        "lambdalisue/fern.vim",
        branch = "main",
        requires = {
            { "lambdalisue/fern-git-status.vim" },
            { "lambdalisue/nerdfont.vim" },
            { "lambdalisue/fern-renderer-nerdfont.vim" },
            { "lambdalisue/glyph-palette.vim" },
        },
        config = function()
            -- fern.vim settings
            -- ref: https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%84%E3%83%AA%E3%83%BC%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B
            -- Ctrl+nでファイルツリーを表示/非表示する
            vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>")

            -- アイコン表示を有効にする
            -- ref: https://qiita.com/matoruru/items/b5ad6e0f1ef6c804378d#%E4%BB%98%E3%81%8D%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%E9%9A%9B%E3%81%AE%E6%B3%A8%E6%84%8F%E7%82%B9
            vim.g["fern#renderer"] = "nerdfont"

            -- アイコンに色をつける
            vim.api.nvim_create_augroup("my_glyph_palette", {})
            vim.api.nvim_create_autocmd("FileType", {
                group = "my_glyph_palette",
                pattern = "fern",
                command = "call glyph_palette#apply()",
            })
            vim.api.nvim_create_autocmd("FileType", {
                group = "my_glyph_palette",
                pattern = { "nerdtree", "startify" },
                command = "call glyph_palette#apply()",
            })

            -- ドットファイルを表示させる
            vim.g["fern#default_hidden"] = 1
        end,
    })

    -- fzf.vim
    use({
        "junegunn/fzf.vim",
        requires = {
            { "junegunn/fzf" },
        },
        config = function()
            -- fzf.vim
            -- Ctrl+pでファイル検索を開く
            -- git管理されていれば:GFiles、そうでなければ:Filesを実行する
            vim.cmd([[
                fun! FzfOmniFiles()
                    let is_git = system('git status')
                    if v:shell_error
                        :Files
                    else
                        :GFiles
                    endif
                endfun
            ]])

            vim.keymap.set("n", "<C-p>", ":call FzfOmniFiles()<CR>")

            -- Ctrl+gで文字列検索を開く
            -- <S-?>でプレビューを表示/非表示する
            vim.cmd([[
                command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
                \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
                \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
                \ <bang>0)
            ]])

            vim.keymap.set("n", "<C-g>", ":Rg<CR>")

            -- frでカーソル位置の単語をファイル検索する
            vim.keymap.set("n", "fr", 'vawy:Rg <C-R>"<CR>')

            -- frで選択した単語をファイル検索する
            --cmd([[xnoremap fr y:Rg <C-R>"<CR>]])
            vim.keymap.set("x", "fr y", ':Rg <C-R>"<CR>')

            -- fbでバッファ検索を開く
            vim.keymap.set("n", "fb", ":Buffers<CR>")

            -- fpでバッファの中で1つ前に開いたファイルを開く
            vim.keymap.set("n", "fp", ":Buffers<CR><CR>")

            -- flで開いているファイルの文字列検索を開く
            vim.keymap.set("n", "fl", ":BLines<CR>")

            -- fmでマーク検索を開く
            vim.keymap.set("n", "fm", ":Marks<CR>")

            -- fhでファイル閲覧履歴検索を開く
            vim.keymap.set("n", "fh", ":History<CR>")

            -- fcでコミット履歴検索を開く
            vim.keymap.set("n", "fc", ":Commits<CR>")
        end,
    })

    -- nvim treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            -- nvim-treesitter config
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    disable = {},
                },
                ensure_installed = {
                    "bash",
                    "c",
                    "c_sharp",
                    "cmake",
                    "cpp",
                    "css",
                    "dockerfile",
                    "fish",
                    "go",
                    "gomod",
                    "gowork",
                    "html",
                    "java",
                    "javascript",
                    "jsdoc",
                    "json",
                    "json5",
                    "latex",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "ninja",
                    "nix",
                    "ocaml",
                    "ocaml_interface",
                    "python",
                    "regex",
                    "rst",
                    "ruby",
                    "rust",
                    "scss",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vue",
                    "yaml",
                },
            })
        end,
    })
    use({ "IndianBoy42/tree-sitter-just" })

    -- coc.nvim
    use({
        "neoclide/coc.nvim",
        branch = "release",
        run = "CocUpdate",
        config = function()
            -- coc.nvim settings
            -- <tab> と<Shift-tab> でナビゲートするやつ
            vim.cmd([[
                function! CheckBackspace() abort
                    let col = col('.') - 1
                    return !col || getline('.')[col - 1]  =~ '\s'
                endfunction
            ]])

            -- Insert <tab> when previous text is space, refresh completion if not.
            vim.cmd([[
                inoremap <silent><expr> <TAB>
                    \ coc#pum#visible() ? coc#pum#next(1):
                    \ CheckBackspace() ? "\<Tab>" :
                    \ coc#refresh()
            ]])
            vim.cmd([[inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

            -- VSCodeライクなタブ補完
            --vim.cmd([[
            --[[
            inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ?
                \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ CheckBackspace() ? "\<TAB>" :
                \ coc#refresh()
            ]]
            --]])
            --vim.cmd([[
            --[[
            function! CheckBackspace() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\s'
            endfunction
            ]]
            --]])
            --vim.g.coc_snippet_next = '<tab>'

            -- coc.nvim settings
            vim.g.coc_global_extensions = {
                "coc-css",
                "coc-deno",
                "coc-eslint",
                "coc-git",
                "coc-html",
                "coc-jest",
                "coc-json",
                "coc-prettier",
                "coc-pyright",
                "coc-rust-analyzer",
                "coc-snippets",
                "coc-solargraph",
                "coc-tsserver",
                "coc-yaml",
                "coc-zls",
            }
        end,
    })

    -- syntax hilights
    use({ "imsnif/kdl.vim" })
    use({ "NoahTheDuke/vim-just" })
    use({ "alker0/chezmoi.vim" })
    use({
        "nastevens/vim-cargo-make",
        requires = {
            { "cespare/vim-toml" },
            { "nastevens/vim-duckscript" },
        },
    })
    use({
        "preservim/vim-markdown",
        requires = {
            { "godlygeek/tabular" },
        },
        config = function()
            -- vim-markdown
            -- 折りたたみ無効化
            vim.g.vim_markdown_folding_disabled = 1

            -- YAMLフロントマターの強調表示
            vim.g.vim_markdown_frontmatter = 1
        end,
    })

    -- utilities
    use({ "mattn/calendar-vim" })
    use({ "vim-jp/vimdoc-ja" })
    use({ "thinca/vim-scouter" })
    use({ "thinca/vim-quickrun" })
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
        config = function()
            require("chatgpt").setup({
                welcome_message = WELCOME_MESSAGE,
                loading_text = "loading",
                question_sign = "", -- you can use emoji if you want e.g. 🙂
                answer_sign = "ﮧ", -- 🤖
                max_line_length = 120,
                yank_register = "+",
                chat_layout = {
                    relative = "editor",
                    position = "50%",
                    size = {
                        height = "80%",
                        width = "80%",
                    },
                },
                settings_window = {
                    border = {
                        style = "rounded",
                        text = {
                            top = " Settings ",
                        },
                    },
                },
                chat_window = {
                    filetype = "chatgpt",
                    border = {
                        highlight = "FloatBorder",
                        style = "rounded",
                        text = {
                            top = " ChatGPT ",
                        },
                    },
                },
                chat_input = {
                    prompt = "  ",
                    border = {
                        highlight = "FloatBorder",
                        style = "rounded",
                        text = {
                            top_align = "center",
                            top = " Prompt ",
                        },
                    },
                },
                openai_params = {
                    model = "gpt-3.5-turbo",
                    frequency_penalty = 0,
                    presence_penalty = 0,
                    max_tokens = 300,
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                openai_edit_params = {
                    model = "code-davinci-edit-001",
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                keymaps = {
                    close = { "<C-c>" },
                    submit = "<C-Enter>",
                    yank_last = "<C-y>",
                    yank_last_code = "<C-k>",
                    scroll_up = "<C-u>",
                    scroll_down = "<C-d>",
                    toggle_settings = "<C-o>",
                    new_session = "<C-n>",
                    cycle_windows = "<Tab>",
                    -- in the Sessions pane
                    select_session = "<Space>",
                    rename_session = "r",
                    delete_session = "d",
                },
            })
        end,
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
    use({
        "airblade/vim-gitgutter",
        config = function()
            -- vim-gitgutter
            -- g]で前の変更箇所へ移動する
            vim.keymap.set("n", "g[", ":GitGutterPrevHunk<CR>")

            -- g[で次の変更箇所へ移動する
            vim.keymap.set("n", "g]", ":GitGutterNextHunk<CR>")

            -- ghでdiffをハイライトする
            vim.keymap.set("n", "gh", ":GitGutterLineHighlightsToggle<CR>")

            -- gpでカーソル行のdiffを表示する
            vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<CR>")

            -- 記号の色を変更する
            vim.cmd([[highlight GitGutterAdd ctermfg=green]])
            vim.cmd([[highlight GitGutterChange ctermfg=blue]])
            vim.cmd([[highlight GitGutterDelete ctermfg=red]])
        end,
    })

    ---- denops.vim
    use({ "vim-denops/denops.vim" })
    use({ "lambdalisue/gin.vim" })
    use({ "skanehira/denops-docker.vim" })
    use({ "willelz/skk-tutorial.vim" })
    use({
        "Omochice/dps-translate-vim",
        config = function()
            -- dps-translate-vim
            vim.g.dps_translate_source = "en"
            vim.g.dps_translate_target = "ja"
        end,
    })

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
        config = function()
            -- lualine.nvim
            --ref:
            --https://raw.githubusercontent.com/numToStr/dotfiles/master/neovim/.config/nvim/lua/numToStr/plugins/lualine.lua
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = "",
                    section_separators = "",
                    icons_enabled = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = {
                        { "mode", color = { gui = "bold" } },
                    },
                    lualine_b = {
                        { "branch" },
                        { "diff", colored = false },
                    },
                    lualine_c = {
                        { "filename", file_status = true },
                        { "diagnostics" },
                    },
                    lualine_x = {
                        "filetype",
                        "encoding",
                        "fileformat",
                    },
                    lualine_y = { "progress" },
                    lualine_z = {
                        { "location", color = { gui = "bold" } },
                    },
                },
                tabline = {
                    lualine_a = {
                        {
                            "buffers",
                            buffers_color = { active = "lualine_b_normal" },
                        },
                    },
                    lualine_z = {
                        {
                            "tabs",
                            tabs_color = { active = "lualine_b_normal" },
                        },
                    },
                },
            })
        end,
    })

    -- other color theme
    use({ "tanvirtin/monokai.nvim" })
    use({ "Allianaab2m/penumbra.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "kihachi2000/yash.nvim" })
    use({ "EdenEast/nightfox.nvim" })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
