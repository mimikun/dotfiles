return {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    event = "InsertEnter",
    cmd = {
        "Copilot",
    },
    config = function()
        require("copilot").setup({})
    end,
    cond = false,
}
