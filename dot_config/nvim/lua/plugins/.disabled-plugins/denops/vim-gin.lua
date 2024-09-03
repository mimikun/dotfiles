---@type table
local cmds = {
    "Gin",
    "GinBuffer",
    "GinBranch",
    "GinBrowse",
    "GinCd",
    "GinLcd",
    "GinTcd",
    "GinChaperon",
    "GinDiff",
    "GinEdit",
    "GinLog",
    "GinPatch",
    "GinStatus",
}

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "lambdalisue/vim-gin",
    --lazy = false,
    cmd = cmds,
    event = "User DenopsReady",
    dependencies = dependencies,
    init = function()
        -- Disable default mappings on buffers shown by |:GinBranch|.
        vim.g.gin_branch_disable_default_mappings = 0

        -- Disable default mappings on buffers shown by |:GinChaperon|.
        vim.g.gin_chaperon_disable_default_mappings = 0

        -- Disable supplemental buffers on |:GinChaperon|.
        vim.g.gin_chaperon_supplement_disable = 0

        -- |Number| that indicates the height of supplemental buffers of |:GinChaperon| command.
        vim.g.gin_chaperon_supplement_height = 10

        -- Disable default mappings on buffers shown by |:GinDiff|.
        vim.g.gin_diff_disable_default_mappings = 0

        -- Disable default mappings on buffers shown by |:GinLog|.
        vim.g.gin_log_disable_default_mappings = 0

        -- Disable default mappings on buffers shown by |:GinPatch|.
        vim.g.gin_patch_disable_default_mappings = 0

        -- Apply changes without confirmation on proxy editors.
        vim.g.gin_proxy_apply_without_confirm = 0

        -- Disable overriding "GIT_ASKPASS" to proxy prompts.
        vim.g.gin_proxy_disable_askpass = 0

        -- Disable overriding "GIT_EDITOR" to proxy editors.
        vim.g.gin_proxy_disable_editor = 0

        -- Opener command (e.g. "split", "vsplit", "tabedit") to open a buffer on proxy editors.
        vim.g.gin_proxy_editor_opener = "tabedit"

        -- Disable default mappings on |:GinStatus| buffer.
        vim.g.gin_status_disable_default_mappings = 0
    end,
    config = function(spec)
        require("denops-lazy").load(spec.name)
    end,
    --cond = false,
    --enabled = false,
}

return spec
