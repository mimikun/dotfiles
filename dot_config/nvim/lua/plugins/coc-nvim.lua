local coc_extensions = {
    "coc-css",
    "coc-deepl",
    "coc-deno",
    "coc-eslint",
    "coc-explorer",
    "coc-git",
    "coc-highlight",
    "coc-html",
    "coc-html-css-support",
    "coc-jest",
    "coc-json",
    "coc-lists",
    "coc-lua",
    "coc-marketplace",
    "coc-pairs",
    "@raidou/coc-prettier-v3",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-toml",
    "coc-tsserver",
    "coc-yaml",
    "@yaegassy/coc-black-formatter",
    "@yaegassy/coc-mypy",
    "@yaegassy/coc-nginx",
    "coc-zig",
}

return {
    "neoclide/coc.nvim",
    branch = "release",
    --lazy = false,
    event = "BufRead",
    build = ":CocUpdate",
    config = function()
        vim.g.coc_global_extensions = coc_extensions

        -- Autocomplete
        function _G.check_back_space()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
        end

        -- vim.keymap.set のoptions
        local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

        -- <TAB> と<S-TAB> で候補選択するやつ
        vim.keymap.set(
            "i",
            "<TAB>",
            'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
            opts
        )
        vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

        -- <CR> つまり Enter で候補決定するやつ
        vim.keymap.set(
            "i",
            "<cr>",
            [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
            opts
        )
    end,
    --cond = false,
}
