local settings = require("config.settings")

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfigPartial
local providers = {
    lazydev = require("plugins.blink-cmp.opts.sources.providers.lazydev"),
    emoji = require("plugins.blink-cmp.opts.sources.providers.emoji"),
    ecolog = require("plugins.blink-cmp.opts.sources.providers.ecolog"),
    nerdfont = require("plugins.blink-cmp.opts.sources.providers.nerdfont"),
    ripgrep = require("plugins.blink-cmp.opts.sources.providers.ripgrep"),
    git = require("plugins.blink-cmp.opts.sources.providers.git"),
    dictionary = require("plugins.blink-cmp.opts.sources.providers.dictionary"),
    tmux = require("plugins.blink-cmp.opts.sources.providers.tmux"),
    spell = require("plugins.blink-cmp.opts.sources.providers.spell"),
    conventional_commits = require("plugins.blink-cmp.opts.sources.providers.conventional-commits"),
    -- WARN: can't use
    --env = require("plugins.blink-cmp.opts.sources.providers.env"),
    --orgmode = require("plugins.blink-cmp.opts.sources.providers.orgmode"),
    --css_vars = require("plugins.blink-cmp.opts.sources.providers.css-vars"),
    --pandoc_references = require("plugins.blink-cmp.opts.sources.providers.pandoc-references"),
    -- NOTE: compat providers
    cmp_yanky = require("plugins.blink-cmp.opts.sources.providers.cmp_yanky"),
    dap = require("plugins.blink-cmp.opts.sources.providers.dap"),
    lorem_ipsum = require("plugins.blink-cmp.opts.sources.providers.lorem_ipsum"),
    go_deep = require("plugins.blink-cmp.opts.sources.providers.go_deep"),
    -- WARN: can't use
    --["html-css"] = require("plugins.blink-cmp.opts.sources.providers.html-css"),
    -- NOTE: built-in providers
    cmdline = require("plugins.blink-cmp.opts.sources.providers.cmdline"),
}

-- NOTE: llm features
local providers_minuet = { minuet = require("plugins.blink-cmp.opts.sources.providers.minuet") }
local providers_avante = { avante = require("plugins.blink-cmp.opts.sources.providers.avante") }
local providers_copilot = { copilot = require("plugins.blink-cmp.opts.sources.providers.copilot") }

if settings.use_minuet then
    providers = vim.tbl_extend("force", providers, providers_minuet)
end

if settings.use_github_copilot then
    providers = vim.tbl_extend("force", providers, providers_copilot)
end

if settings.use_avante then
    providers = vim.tbl_extend("force", providers, providers_avante)
end

return providers
