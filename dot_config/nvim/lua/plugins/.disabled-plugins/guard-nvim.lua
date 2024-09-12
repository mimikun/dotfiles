---@type table
local cmds = {
    "GuardFmt",
    "GuardDisable",
    "GuardEnable",
}

---@type LazySpec
local spec = {
    "nvimdev/guard.nvim",
    --lazy = false,
    cmd = cmds,
    event = "VeryLazy",
    dependencies = { "nvimdev/guard-collection" },
    config = function()
        local ft = require("guard.filetype")

        ft("c"):fmt("clang-format"):lint("clang-tidy")
        ft("lua"):fmt("lsp"):append("stylua"):lint("selene")
        ft("python"):fmt("lsp"):append("black"):lint("pylint", "flake8", "ruff", "mypy")
        ft("typescript,javascript"):fmt("lsp"):append("prettier")
        ft("go"):fmt("lsp"):append("gofmt")
        ft("rust"):fmt("lsp"):append("rustfmt")
        ft("toml"):fmt("lsp"):append("taplo")

        require("guard").setup({
            fmt_on_save = true,
            lsp_as_default_formatter = false,
            save_on_fmt = false,
        })
    end,
    --cond = false,
}

return spec
