---@type table
local lga_config = {
    auto_quoting = true,
    mappings = {
        i = {
            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            ["<C-space>"] = require("telescope.actions").to_fuzzy_refine,
        },
    },
}

return lga_config
