---@type table
local cmds = {
    "ConformInfo",
    "FormatDisable",
    "FormatEnable",
    "Format",
}

---@type LazyKeysSpec[]
local keys = {
    {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
            require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
    },
}

---@module "conform"
---@type conform.setupOpts
local opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = {
            --`autoflake` - Removes unused imports and unused variables as reported by pyflakes.
            --`autopep8` - A tool that automatically formats Python code to conform to the PEP8 style guide.
            --`black` - The uncompromising Python code formatter.
            --`blue` - The slightly less uncompromising Python code formatter.
            --`isort` - Python utility / library to sort imports alphabetically and automatically separate them into sections and by type.
            --`pyink` - A Python formatter, forked from Black with a few different formatting behaviors.
            --`ruff_fix` - An extremely fast Python linter, written in Rust. Fix lint errors.
            --`ruff_format` - An extremely fast Python linter, written in Rust. Formatter subcommand.
            --`ruff_organize_imports` - An extremely fast Python linter, written in Rust. Organize imports.
            --`usort` - Safe, minimal import sorting for Python projects.
            --`yapf` - Yet Another Python Formatter.
            --`reorder-python-imports` - Rewrites source to reorder python imports
        },
        --[[
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        ]]
        javascript = {
            --`biome` - A toolchain for web projects, aimed to provide functionalities to maintain them.
            --`standardjs` - JavaScript Standard style guide, linter, and formatter.
        },
        cmake = {
            --`cmake_format` - Parse cmake listfiles and format them nicely.
            --`gersemi` - A formatter to make your CMake code the real treasure.
        },
        crystal = { "crystal" },
        ruby = {
            --`rubocop` - Ruby static code analyzer and formatter, based on the community Ruby style guide.
            --`rubyfmt` - Ruby Autoformatter! (Written in Rust)
            --`rufo` - Rufo is an opinionated ruby formatter.
            --`standardrb` - Ruby's bikeshed-proof linter and formatter.
        },
        typescript = {
            --`deno_fmt` - Use [Deno](https://deno.land/) to format TypeScript, JavaScript/JSON and markdown.
        },
        c = {
            --`clang-format` - Tool to format C/C++/… code according to a set of rules and heuristics.
            --`uncrustify` - A source code beautifier for C, C++, C#, ObjectiveC, D, Java, Pawn and Vala.
        },
        cpp = {
            --`clang-format` - Tool to format C/C++/… code according to a set of rules and heuristics.
            --`uncrustify` - A source code beautifier for C, C++, C#, ObjectiveC, D, Java, Pawn and Vala.
        },
        erlang = {
            --`efmt` - Erlang code formatter.
            --`erlfmt` - An automated code formatter for Erlang.
        },
        elm = { "elm_format" },
        fish = { "fish_indent" },
        go = {
            --`gci` - GCI, a tool that controls Go package import order and makes it always deterministic.
            --`asmfmt` - Go Assembler Formatter
            --`gofmt` - Formats go programs.
            --`gofumpt` - Enforce a stricter format than gofmt, while being backwards compatible. That is, gofumpt is happy with a subset of the formats that gofmt is happy with.
            --`goimports` - Updates your Go import lines, adding missing ones and removing unreferenced ones.
            --`goimports-reviser` - Right imports sorting & code formatting tool (goimports alternative).
            --`golines` - A golang formatter that fixes long lines.
        },
        --go = { "goimports", "gofmt" },
        json = { "fixjson" },
        gleam = { "gleam" },
        html = {
            --`htmlbeautifier` - A normaliser/beautifier for HTML that also understands embedded Ruby. Ideal for tidying up Rails templates.
            --`superhtml` - HTML Language Server and Templating Language Library.
        },
        just = { "just" },
        markdown = {
            --`markdown-toc` - API and CLI for generating a markdown TOC (table of contents) for a README or any markdown files.
            --`markdownfmt` - Like gofmt, but for Markdown.
            --`markdownlint` - A Node.js style checker and lint tool for Markdown/CommonMark files.
            --`markdownlint-cli2` - A fast, flexible, configuration-based command-line interface for linting Markdown/CommonMark files with the markdownlint library.
            --`mdformat` - An opinionated Markdown formatter.
            --`mdsf` - Format markdown code blocks using your favorite code formatters.
            --`mdslw` - Prepare your markdown for easy diff'ing by adding line breaks after every sentence.
        },
        elixir = { "mix" },
        nix = {
            --`nixfmt` - The official (but not yet stable) formatter for Nix code.
            --`nixpkgs_fmt` - nixpkgs-fmt is a Nix code formatter for nixpkgs.
        },
        ocaml = {
            --`ocamlformat` - Auto-formatter for OCaml code.
            --`ocp-indent` - Automatic indentation of OCaml source files.
        },
        php = {
            --`php_cs_fixer` - The PHP Coding Standards Fixer.
            --`phpcbf` - PHP Code Beautifier and Fixer fixes violations of a defined coding standard.
            --`phpinsights` - The perfect starting point to analyze the code quality of your PHP projects.
            --`pretty-php` - The opinionated PHP code formatter.
        },
        rust = {
            --`rustfmt` - A tool for formatting rust code according to style guidelines.
            --`rustywind` - A tool for formatting Tailwind CSS classes.
        },
        --rust = { "rustfmt", lsp_format = "fallback" },
        scala = { "scalafmt" },
        css = { "stylelint" },
        swift = {
            --`swift_format` - Swift formatter from apple. Requires building from source with `swift build`.
            --`swiftformat` - SwiftFormat is a code library and command-line tool for reformatting `swift` code on macOS or Linux.
            --`swiftlint` - A tool to enforce Swift style and conventions.
        },
        toml = { "taplo" },
        xml = {
            --`xmllint` - Despite the name, xmllint can be used to format XML files as well as lint them.
            --`xmlformat` - xmlformatter is an Open Source Python package, which provides formatting of XML documents.
        },
        yaml = {
            --`yamlfix` - A configurable YAML formatter that keeps comments.
            --`yamlfmt` - yamlfmt is an extensible command line tool or library to format yaml files.
        },
        zig = { "zigfmt" },
        sql = {
            --`sql_formatter` - A whitespace formatter for different query languages.
            --`sqlfluff` - A modular SQL linter and auto-formatter with support for multiple dialects and templated code.
            --`sqlfmt` - sqlfmt formats your dbt SQL files so you don't have to. It is similar in nature to Black, gofmt, and rustfmt (but for SQL)
        },
        bash = {
            --`shellcheck` - A static analysis tool for shell scripts.
            --`shellharden` - The corrective bash syntax highlighter.
            --`shfmt` - A shell parser, formatter, and interpreter with `bash` support.
        },
        zsh = {
            --`shellcheck` - A static analysis tool for shell scripts.
            --`shellharden` - The corrective bash syntax highlighter.
            --`shfmt` - A shell parser, formatter, and interpreter with `bash` support.
        },
        rst = {
            --`docstrfmt` - reStructuredText formatter.
            --`rstfmt` - A formatter for reStructuredText.
        },
        ["*"] = { "typos" },
        ["_"] = {
            "trim_newlines",
            "trim_whitespace",
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
        end

        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
            return
        end

        return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    notify_on_error = true,
    notify_no_formatters = true,
}

---@type LazySpec
local spec = {
    "stevearc/conform.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    event = "BufWritePre",
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function()
        local conform = require("conform")

        conform.setup(opts)

        -- define user commands
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            conform.format({ async = true, lsp_format = "fallback", range = range })
        end, {
            range = true,
            desc = "Run async formatting",
        })
    end,
    --cond = false,
}

return spec

-- NOTE: uncategorized formatters
--`ast-grep` - A CLI tool for code structural search, lint and rewriting. Written in Rust.
--`astyle` - A Free, Fast, and Small Automatic Formatter for C, C++, C++/CLI, Objective-C, C#, and Java Source Code.
--`auto_optional` - Adds the Optional type-hint to arguments where the default value is None.
--`autocorrect` - A linter and formatter to help you to improve copywriting, correct spaces, words, and punctuations between CJK.
--`bean-format` - Reformat Beancount files to right-align all the numbers at the same, minimal column.
--`biome-check` - A toolchain for web projects, aimed to provide functionalities to maintain them.
--`darker` - Run black only on changed lines.
--`djlint` - ✨ HTML Template Linter and Formatter. Django - Jinja - Nunjucks - Handlebars - GoLang.
--`docformatter` - docformatter automatically formats docstrings to follow a subset of the PEP 257 conventions.
--`doctoc` - Generates table of contents for markdown files inside local git repository.
--`erb_format` - Format ERB files with speed and precision.
--`eslint_d` - Like ESLint, but faster.
--`format-queries` - Tree-sitter query formatter.
--`indent` - GNU Indent.
--`injected` - Format treesitter injected languages.
--`pangu` - Insert whitespace between CJK and half-width characters.
--`pg_format` - PostgreSQL SQL syntax beautifier.
--`prettier` - Prettier is an opinionated code formatter. It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.
--`prettierd` - prettier, as a daemon, for ludicrous formatting speed.
--`templ` - Formats templ template files.
--`jq` - Command-line JSON processor.
--`yq` - YAML/JSON processor
