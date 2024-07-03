---@type table
local opts = {
    popupWin = {
        title = " rip-substitute",
        border = "single",
        -- "top"|"bottom"
        position = "bottom",
    },
    regexOptions = {
        -- pcre2 enables lookarounds and backreferences, but performs slower
        pcre2 = true,
        ---@type "case-sensitive"|"ignore-case"|"smart-case"
        casing = "case-sensitive",
        -- disable if you use named capture groups (see README for details)
        autoBraceSimpleCaptureGroups = true,
    },
    editingBehavior = {
        -- Experimental. When typing `()` in the `search` line, automatically
        -- adds `$n` to the `replace` line.
        autoCaptureGroups = false,
    },
}

---@type LazySpec
local spec = {
    "chrisgrieser/nvim-rip-substitute",
    --lazy = false,
    cmd = "RipSubstitute",
    opts = opts,
    --cond = false,
}

return spec
