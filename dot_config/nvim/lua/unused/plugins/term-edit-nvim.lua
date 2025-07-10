---@type table
local prompt_ends = {
    bash = "%$ ",
    zsh = "%$ ",
    powershell = "> ",
    fish = "> ",
    cmd = ">",
}

---@type TermEditOpts
local opts = {
    prompt_end = prompt_ends.fish,
}

---@type LazySpec
local spec = {
    "chomosuke/term-edit.nvim",
    --lazy = false,
    version = "1.*",
    event = "TermOpen",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
