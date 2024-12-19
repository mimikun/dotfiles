local snippets = {
    -- Function to use when expanding LSP provided snippets
    expand = function(snippet)
        vim.snippet.expand(snippet)
    end,
    -- Function to use when checking if a snippet is active
    active = function(filter)
        return vim.snippet.active(filter)
    end,
    -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
    jump = function(direction)
        vim.snippet.jump(direction)
    end,
}

return snippets
--[[
local luasnip_support_opts = {
    snippets = {
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end,
    },
    sources = {
      default = { 'lsp', 'path', 'luasnip', 'buffer' },
    },
  }
}
]]
