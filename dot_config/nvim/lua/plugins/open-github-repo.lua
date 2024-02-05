return {
    "fowlie/open-github-repo",
    --lazy = false,
    --event = "BufRead",
    --keys = keymaps,
    ft = "lua",
    config = function()
        require("open-github-repo")
    end,
    cond = false,
}
