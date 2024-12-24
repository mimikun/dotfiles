local ext = {
    auto_quoting = true,
    mappings = {
        i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            ["<C-space>"] = actions.to_fuzzy_refine,
        },
    },
}

return ext
