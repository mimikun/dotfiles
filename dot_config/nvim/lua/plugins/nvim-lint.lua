-- TODO: cond setting
local cond = false

---@type LazySpec
local spec = {
    "mfussenegger/nvim-lint",
    lazy = false,
    --event = "VeryLazy",
    config = function()
        local lint = require("lint")

        -- set filetype linter
        lint.linters_by_ft = {
            lua = { "selene" },
            yaml = { "yamllint" },
            swift = { "swiftlint" },
            makefile = { "checkmake" },
            cmake = { "cmakelint" },
            editorconfig = { "editorconfig-checker" },
            dockerfile = { "hadolint" },
            css = { "stylelint" },
            ruby = { "ruby" },
            vim = { "vint" },
            json = { "jsonlint" },
            -- TODO: what filetype?
            --git = {"gitlint","commitlint"},
        }

        -- define autocmd
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
                -- typo check or more
                lint.try_lint("typos")
                -- TODO: add custom linter
                --lint.try_lint("textlint")
            end,
        })
    end,
    cond = cond,
    enabled = cond,
}

return spec

--[[
| Tool                                   | Linter name            |
| -------------------------------------- | ---------------------- |
| [actionlint][actionlint]               | `actionlint`           |
| [ameba][ameba]                         | `ameba`                |
| [ansible-lint][ansible-lint]           | `ansible_lint`         |
| [bandit][bandit]                       | `bandit`               |
| [bean-check][bean-check]               | `bean_check`           |
| [biomejs][biomejs]                     | `biomejs`              |
| [blocklint][blocklint]                 | `blocklint`            |
| [buf_lint][buf_lint]                   | `buf_lint`             |
| [buildifier][buildifier]               | `buildifier`           |
| [cfn-lint][cfn-lint]                   | `cfn_lint`             |
| [cfn_nag][cfn_nag]                     | `cfn_nag`              |
| [checkpatch.pl][checkpatch]            | `checkpatch`           |
| [checkstyle][checkstyle]               | `checkstyle`           |
| [chktex][20]                           | `chktex`               |
| [clang-tidy][23]                       | `clangtidy`            |
| [clazy][30]                            | `clazy`                |
| [clippy][clippy]                       | `clippy`               |
| [clj-kondo][24]                        | `clj-kondo`            |
| [cppcheck][22]                         | `cppcheck`             |
| [cpplint][cpplint]                     | `cpplint`              |
| [credo][credo]                         | `credo`                |
| [cue][cue]                             | `cue`                  |
| [curlylint][curlylint]                 | `curlylint`            |
| [dash][dash]                           | `dash`                 |
| [deadnix][deadnix]                     | `deadnix`              |
| [deno][deno]                           | `deno`                 |
| [DirectX Shader Compiler][dxc]         | `dxc`                  |
| [djlint][djlint]                       | `djlint`               |
| [dotenv-linter][dotenv-linter]         | `dotenv_linter`        |
| [erb-lint][erb-lint]                   | `erb_lint`             |
| [ESLint][25]                           | `eslint`               |
| [eslint_d][37]                         | `eslint_d`             |
| [eugene][eugene]                       | `eugene`               |
| [fennel][fennel]                       | `fennel`               |
| [fish][fish]                           | `fish`                 |
| [flawfinder][35]                       | `flawfinder`           |
| [gdlint (gdtoolkit)][gdlint]           | `gdlint`               |
| [GHDL][ghdl]                           | `ghdl`                 |
| [glslc][glslc]                         | `glslc`                |
| [Golangci-lint][16]                    | `golangcilint`         |
| [hledger][hledger]                     | `hledger`              |
| [hlint][32]                            | `hlint`                |
| [HTML Tidy][12]                        | `tidy`                 |
| [Inko][17]                             | `inko`                 |
| [janet][janet]                         | `janet`                |
| [joker][joker]                         | `joker`                |
| [jshint][jshint]                       | `jshint`               |
| [ktlint][ktlint]                       | `ktlint`               |
| [lacheck][lacheck]                     | `lacheck`              |
| [Languagetool][5]                      | `languagetool`         |
| [mlint][34]                            | `mlint`                |
| [Nagelfar][nagelfar]                   | `nagelfar`             |
| [Nix][nix]                             | `nix`                  |
| [npm-groovy-lint][npm-groovy-lint]     | `npm-groovy-lint`      |
| [oelint-adv][oelint-adv]               | `oelint-adv`           |
| [opa_check][opa_check]                 | `opa_check`            |
| [oxlint][oxlint]                       | `oxlint`               |
| [perlcritic][perlcritic]               | `perlcritic`           |
| [perlimports][perlimports]             | `perlimports`          |
| [ponyc][ponyc]                         | `pony`                 |
| [prisma-lint][prisma-lint]             | `prisma-lint`          |
| [proselint][proselint]                 | `proselint`            |
| [protolint][protolint]                 | `protolint`            |
| [psalm][psalm]                         | `psalm`                |
| [puppet-lint][puppet-lint]             | `puppet-lint`          |
| [Pylint][15]                           | `pylint`               |
| [quick-lint-js][quick-lint-js]         | `quick-lint-js`        |
| [regal][regal]                         | `regal`                |
| [Revive][14]                           | `revive`               |
| [rflint][rflint]                       | `rflint`               |
| [robocop][robocop]                     | `robocop`              |
| [RPM][rpm]                             | `rpmspec`              |
| [RuboCop][rubocop]                     | `rubocop`              |
| [salt-lint][salt-lint]                 | `saltlint`             |
| [ShellCheck][10]                       | `shellcheck`           |
| [snyk][snyk]                           | `snyk_iac`             |
| [Solhint][solhint]                     | `solhint`              |
| [Spectral][spectral]                   | `spectral`             |
| [sqlfluff][sqlfluff]                   | `sqlfluff`             |
| [standardjs][standardjs]               | `standardjs`           |
| [StandardRB][27]                       | `standardrb`           |
| [statix check][33]                     | `statix`               |
| [systemd-analyze][systemd-analyze]     | `systemd-analyze`      |
| [systemdlint][systemdlint]             | `systemdlint`          |
| [tflint][tflint]                       | `tflint`               |
| [tfsec][tfsec]                         | `tfsec`                |
| [tlint][tlint]                         | `tlint`                |
| [trivy][trivy]                         | `trivy`                |
| [VSG][vsg]                             | `vsg`                  |
| [vulture][vulture]                     | `vulture`              |
| [woke][woke]                           | `woke`                 |
| [write-good][write-good]               | `write_good`           |
| [yamllint][yamllint]                   | `yamllint`             |
| [zsh][zsh]                             | `zsh`                  |

-- GH action
"actionlint",

-- JavaScript/TypeScript
-- TypeScript/JavaScript
-- JavaScript/TypeScript
"oxlint",
"eslint_d",
"biome",
-- JavaScript
"standardjs",
-- TypeScript
"ts-standard",


-- git commit
"gitleaks",

-- Cpp
"cpplint",

-- ERB
"erb-lint",


-- Golang
"revive",
"golangci-lint",
"gospel",

-- HAML
"haml-lint",

-- HTML
"markuplint",
"htmlhint",

-- Jinja
"jinja-lsp",

-- reStructuredText
"rstcheck",
| [rstlint][rstlint]                     | `rstlint`              |

-- shell script
"shellcheck",

-- Ruby
"rubocop",
"standardrb",

-- systemd unit file
"systemdlint",

-- markdown
"markdownlint",
"markdownlint-cli2",
"alex",

-- PHP
"phpcs",
"phpmd",
"phpstan",
"phpinsights",
"php",

-- Python
"flake8",
"pflake8",
"pydocstyle",
"pycodestyle",
"ruff",
"mypy",

"flakeheaven",
"pyflakes",
"pylama",
"pylint",
"pyre",
]]
