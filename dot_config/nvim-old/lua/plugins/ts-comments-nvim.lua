---@type table
local opts = {
    lang = {
        astro = "<!-- %s -->",
        axaml = "<!-- %s -->",
        blueprint = "// %s",
        c = "// %s",
        c_sharp = "// %s",
        clojure = { ";; %s", "; %s" },
        cpp = "// %s",
        cs_project = "<!-- %s -->",
        css = "/* %s */",
        cue = "// %s",
        fsharp = "// %s",
        fsharp_project = "<!-- %s -->",
        gleam = "// %s",
        glimmer = "{{! %s }}",
        handlebars = "{{! %s }}",
        hcl = "# %s",
        html = "<!-- %s -->",
        ini = "; %s",
        javascript = {
            -- default commentstring when no treesitter node matches
            "// %s",
            "/* %s */",
            -- specific commentstring for call_expression
            call_expression = "// %s",
            jsx_attribute = "// %s",
            jsx_element = "{/* %s */}",
            jsx_fragment = "{/* %s */}",
            spread_element = "// %s",
            statement_block = "// %s",
        },
        -- langs can have multiple commentstrings
        lua = { "-- %s", "--- %s" },
        ocaml = "(* %s *)",
        php = "// %s",
        rego = "# %s",
        rescript = "// %s",
        rust = { "// %s", "/* %s */", "/// %s" },
        svelte = "<!-- %s -->",
        terraform = "# %s",
        tsx = {
            -- default commentstring when no treesitter node matches
            "// %s",
            "/* %s */",
            -- specific commentstring for call_expression
            call_expression = "// %s",
            jsx_attribute = "// %s",
            jsx_element = "{/* %s */}",
            jsx_fragment = "{/* %s */}",
            spread_element = "// %s",
            statement_block = "// %s",
        },
        twig = "{# %s #}",
        typescript = "// %s",
        vim = '" %s',
        vue = "<!-- %s -->",
        xaml = "<!-- %s -->",
        xml = "<!-- %s -->",
    },
}

---@type LazySpec
local spec = {
    "folke/ts-comments.nvim",
    --lazy = false,
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    event = "VeryLazy",
    opts = opts,
    --cond = false,
}

return spec
