local repo = vim.fn.expand("$GHQ_ROOT/github.com/mimikun/tenki.lua")

--local events = {}
--local cmds = {}
--local opts = {}

return {
    dir = repo,
    lazy = false,
    --event = events,
    --cmd = cmds,
    --dependencies = {},
    --opts = opts,
    cond = false,
}
