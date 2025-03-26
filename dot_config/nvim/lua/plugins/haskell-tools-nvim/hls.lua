---@class haskell-tools.lsp.ClientConfig haskell-language-server client options.
local hls = {
    settings = function(project_root)
        local ht = require("haskell-tools")
        return ht.lsp.load_hls_settings(project_root)
    end,
    default_settings = {
        haskell = {
            formattingProvider = "fourmolu",
            maxCompletions = 40,
            checkProject = true,
            checkParents = "CheckOnSave",
            plugin = {
                alternateNumberFormat = { globalOn = true },
                callHierarchy = { globalOn = true },
                changeTypeSignature = { globalOn = true },
                class = {
                    codeActionsOn = true,
                    codeLensOn = true,
                },
                eval = {
                    globalOn = true,
                    config = {
                        diff = true,
                        exception = true,
                    },
                },
                excplicitFixity = { globalOn = true },
                gadt = { globalOn = true },
                ["ghcide-code-actions-bindings"] = { globalOn = true },
                ["ghcide-code-actions-fill-holes"] = { globalOn = true },
                ["ghcide-code-actions-imports-exports"] = { globalOn = true },
                ["ghcide-code-actions-type-signatures"] = { globalOn = true },
                ["ghcide-completions"] = {
                    globalOn = true,
                    config = {
                        autoExtendOn = true,
                        snippetsOn = true,
                    },
                },
                ["ghcide-hover-and-symbols"] = {
                    hoverOn = true,
                    symbolsOn = true,
                },
                ["ghcide-type-lenses"] = {
                    globalOn = true,
                    config = {
                        mode = "always",
                    },
                },
                haddockComments = { globalOn = true },
                hlint = {
                    codeActionsOn = true,
                    diagnosticsOn = true,
                },
                importLens = {
                    globalOn = true,
                    codeActionsOn = true,
                    codeLensOn = true,
                },
                moduleName = { globalOn = true },
                pragmas = {
                    codeActionsOn = true,
                    completionOn = true,
                },
                qualifyImportedNames = { globalOn = true },
                refineImports = {
                    codeActionsOn = true,
                    codeLensOn = true,
                },
                rename = {
                    globalOn = true,
                    config = { crossModule = true },
                },
                retrie = { globalOn = true },
                splice = { globalOn = true },
                tactics = {
                    codeActionsOn = true,
                    codeLensOn = true,
                    config = {
                        auto_gas = 4,
                        hole_severity = nil,
                        max_use_ctor_actions = 5,
                        proofstate_styling = true,
                        timeout_duration = 2,
                    },
                    hoverOn = true,
                },
            },
        },
    },
}

return hls
