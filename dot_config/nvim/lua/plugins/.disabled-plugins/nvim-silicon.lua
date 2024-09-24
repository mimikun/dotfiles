---@type table
local opts = {
    -- Configuration here, or leave empty to use defaults
    line_offset = function(args)
        return args.line1
    end,
}

---@type LazySpec
local spec = {
    "michaelrommel/nvim-silicon",
    main = "nvim-silicon",
    --lazy = false,
    cmd = "Silicon",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
