---@type LazyKeysSpec[]
local keys = {
    -- TODO: keys
}

---@type LazySpec[]
local dependencies = {
    -- TODO: deps
}

---@type LazySpec
local spec = {
    "nvimtools/hydra.nvim",
    --lazy = false,
    --keys = keys,
    --dependencies = dependencies,
    config = function()
        -- TODO: create hydras in here
    end,
    cond = false,
    enabled = false,
}

return spec
