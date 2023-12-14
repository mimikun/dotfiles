-- Invalidate if there are no human rights
local cond = require("core.global").is_human_rights

local repo = vim.fn.expand("$GHQ_ROOT/github.com/mimikun/dps-tenki-vim")

--local events = {}
--local cmds = {}
--local opts = {}

return {
    dir = repo,
    lazy = false,
    --event = events,
    --cmd = cmds,
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        vim.g["denops#debug"] = 1
    end,
    --opts = opts,
    cond = false,
}
