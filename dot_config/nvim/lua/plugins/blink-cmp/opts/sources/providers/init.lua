local settings = require("config.settings")

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfigPartial
local providers = {
    -- NOTE: built-in providers
    cmdline = require("plugins.blink-cmp.opts.sources.providers.cmdline"),
    -- NOTE: community-sources providers
    lazydev = require("plugins.blink-cmp.opts.sources.providers.lazydev"),
    ripgrep = require("plugins.blink-cmp.opts.sources.providers.ripgrep"),
    emoji = require("plugins.blink-cmp.opts.sources.providers.emoji"),
    nerdfont = require("plugins.blink-cmp.opts.sources.providers.nerdfont"),
    dictionary = require("plugins.blink-cmp.opts.sources.providers.dictionary"),
    git = require("plugins.blink-cmp.opts.sources.providers.git"),
    spell = require("plugins.blink-cmp.opts.sources.providers.spell"),
    tmux = require("plugins.blink-cmp.opts.sources.providers.tmux"),
    wezterm = require("plugins.blink-cmp.opts.sources.providers.wezterm"),
    ecolog = require("plugins.blink-cmp.opts.sources.providers.ecolog"),
    conventional_commits = require("plugins.blink-cmp.opts.sources.providers.conventional-commits"),
    yank = require("plugins.blink-cmp.opts.sources.providers.yank"),
    -- NOTE: using blink.compat providers
    dap = require("plugins.blink-cmp.opts.sources.providers.dap"),
    --orgmode = require("plugins.blink-cmp.opts.sources.providers.orgmode"),
}

-- NOTE: llm features providers
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
