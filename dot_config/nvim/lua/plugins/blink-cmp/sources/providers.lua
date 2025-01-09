---@type table
local providers = {
    lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
    },
    emoji = {
        name = "Emoji",
        module = "blink-emoji",
        score_offset = 15,
        opts = { insert = true },
    },
    crates = {
        name = "crates",
        module = "blink.compat.source",
    },
    yanky = {
        name = "cmp_yanky",
        module = "blink.compat.source",
    },
    ecolog = {
        name = "ecolog",
        module = "ecolog.integrations.cmp.blink_cmp",
    },
    copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
        transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
                item.kind = kind_idx
            end
            return items
        end,
    },
    obsidian = {
        name = "obsidian",
        module = "blink.compat.source",
    },
    obsidian_new = {
        name = "obsidian_new",
        module = "blink.compat.source",
    },
    obsidian_tags = {
        name = "obsidian_tags",
        module = "blink.compat.source",
    },
    avante_commands = {
        name = "avante_commands",
        module = "blink.compat.source",
        score_offset = 90,
        opts = {},
    },
    avante_files = {
        name = "avante_commands",
        module = "blink.compat.source",
        score_offset = 100,
        opts = {},
    },
    avante_mentions = {
        name = "avante_mentions",
        module = "blink.compat.source",
        score_offset = 1000,
        opts = {},
    },
    render_markdown = {
        name = "RenderMarkdown",
        module = "render-markdown.integ.blink",
        fallbacks = { "lsp" },
    },
    ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        transform_items = function(_, items)
            for _, item in ipairs(items) do
                item.labelDetails = {
                    description = "(rg)",
                }
            end
            return items
        end,
    },
}

return providers
