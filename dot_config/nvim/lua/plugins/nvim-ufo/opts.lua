---@type UfoConfig
local opts = {
    open_fold_hl_timeout = 400,
    provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
    end,
    close_fold_kinds_for_ft = { default = {} },
    fold_virt_text_handler = nil,
    enable_get_fold_virt_text = false,
    preview = {
        win_config = {
            border = "rounded",
            winblend = 12,
            winhighlight = "Normal:Normal",
            maxheight = 20,
        },
        mappings = {
            scrollB = "",
            scrollF = "",
            scrollU = "",
            scrollD = "",
            scrollE = "<C-E>",
            scrollY = "<C-Y>",
            jumpTop = "",
            jumpBot = "",
            close = "q",
            switch = "<Tab>",
            trace = "<CR>",
        },
    },
}

return opts
