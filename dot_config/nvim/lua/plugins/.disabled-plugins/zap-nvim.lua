-- TODO: setting it
-- To pass the enhanced capabilities to your LSP client:
--[[
local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('zap').register_cap()
)
]]

---@type table
local opts = {
    -- Debounce time to avoid triggering complete too frequently
    debounce_time = 2,
    -- Width of the completion popup menu
    pum_width = 33,
    -- Format LSP kind indicators, e.g., "Field", "Struct", "Keyword"
    kind_format = function(k)
        return k:lower():sub(1, 1)
    end,
    -- Custom formatting for completion entries
    additional_format_completion = function(entry)
        -- Default does nothing, can be customized
        return entry
    end,
    -- Adjust score of particular completion entries
    --additional_score_handler = function(score, entry)
    additional_score_handler = function(score)
        -- Default does nothing, can be customized
        return score
    end,
    -- Customize sorting of completion entries
    additional_sorting_handler = function(entries)
        -- Default does nothing, can be customized
        return entries
    end,
}

---@type LazySpec
local spec = {
    "hanspinckaers/zap.nvim",
    lazy = false,
    --event = "VeryLazy",
    init = function()
        -- Suggested completeopt
        vim.opt.completeopt = "menu,menuone,noselect"
    end,
    config = function()
        require("zap").setup(opts)

        -- TAB for completion cycling
        vim.keymap.set("i", "<TAB>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-n>"
            elseif vim.snippet and vim.snippet.jumpable(1) then
                return "<cmd>lua vim.snippet.jump(1)<cr>"
            else
                return "<TAB>"
            end
        end, { expr = true })
        vim.keymap.set("i", "<S-TAB>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-p>"
            elseif vim.snippet and vim.snippet.jumpable(-1) then
                return "<cmd>lua vim.snippet.jump(-1)<CR>"
            else
                return "<S-TAB>"
            end
        end, { expr = true })
    end,
    cond = false,
    enabled = false,
}

return spec
