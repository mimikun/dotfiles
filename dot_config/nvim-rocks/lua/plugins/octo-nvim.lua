---@type OctoConfig
local opts = {
    default_remote = { "upstream", "origin" },
    default_merge_method = "rebase",
    picker = "telescope",
}

require("octo").setup(opts)
