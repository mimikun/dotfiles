---@type haskell-tools.tools.Config
local tools = {
    codeLens = { autoRefresh = true },
    hoogle = { mode = "auto" },
    hover = {
        enable = function()
            local has_jit = pcall(require, "jit")
            return has_jit
        end,
        border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        },
        stylize_markdown = false,
        auto_focus = false,
    },
    definition = { hoogle_signature_fallback = false },
    repl = {
        -- TODO: it
        ---@type haskell-tools.repl.Handler | (fun():haskell-tools.repl.Handler) `'builtin'`: Use the simple builtin repl. `'toggleterm'`: Use akinsho/toggleterm.nvim.
        handler = "builtin",
        prefer = function()
            return vim.fn.executable("stack") == 1 and "stack" or "cabal"
        end,
        builtin = {
            create_repl_window = function(view)
                return view.create_repl_split({ size = vim.o.lines / 3 })
            end,
        },
        auto_focus = nil,
    },
    tags = {
        enable = function()
            return vim.fn.executable("fast-tags") == 1
        end,
        package_events = { "BufWritePost" },
    },
    log = {
        logfile = vim.fs.joinpath(vim.fn.stdpath("log"), "haskell-tools.log"),
        level = vim.log.levels.WARN,
    },
    open_url = function(url)
        require("haskell-tools.os").open_browser(url)
    end,
}

return tools
