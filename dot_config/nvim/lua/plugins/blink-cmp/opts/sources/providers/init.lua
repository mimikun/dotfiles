-- TODO: Dynamically change provider

local settings = require("config.settings")

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfigPartial
local providers = {
    lazydev = require("plugins.blink-cmp.opts.sources.providers.lazydev"),
    emoji = require("plugins.blink-cmp.opts.sources.providers.emoji"),
    ecolog = require("plugins.blink-cmp.opts.sources.providers.ecolog"),
    --env = require("plugins.blink-cmp.opts.sources.providers.env"),
    nerdfont = require("plugins.blink-cmp.opts.sources.providers.nerdfont"),
    ripgrep = require("plugins.blink-cmp.opts.sources.providers.ripgrep"),
    git = require("plugins.blink-cmp.opts.sources.providers.git"),
    dictionary = require("plugins.blink-cmp.opts.sources.providers.dictionary"),
    tmux = require("plugins.blink-cmp.opts.sources.providers.tmux"),
    spell = require("plugins.blink-cmp.opts.sources.providers.spell"),
    conventional_commits = require("plugins.blink-cmp.opts.sources.providers.conventional-commits"),
    -- BUG: can't use
    --orgmode = require("plugins.blink-cmp.opts.sources.providers.orgmode"),
    --css_vars = require("plugins.blink-cmp.opts.sources.providers.css-vars"),
    --pandoc_references = require("plugins.blink-cmp.opts.sources.providers.pandoc-references"),
    -- NOTE: compat providers
    cmp_yanky = require("plugins.blink-cmp.opts.sources.providers.cmp_yanky"),
    dap = require("plugins.blink-cmp.opts.sources.providers.dap"),
    ["html-css"] = require("plugins.blink-cmp.opts.sources.providers.html-css"),
    -- NOTE: built-in providers
    cmdline = require("plugins.blink-cmp.opts.sources.providers.cmdline"),
    -- NOTE: llm features
    minuet = require("plugins.blink-cmp.opts.sources.providers.minuet"),
    avante = require("plugins.blink-cmp.opts.sources.providers.avante"),
    copilot = require("plugins.blink-cmp.opts.sources.providers.copilot"),
}

return providers
