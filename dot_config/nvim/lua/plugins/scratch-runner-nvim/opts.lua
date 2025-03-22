---@type scratch-runner.Config
local opts = {
    ---@type string?
    run_key = "<CR>",

    ---@type string?
    output_switch_key = "<Tab>",

    ---@type table<string, scratch-runner.SourceSpec>
    sources = {
        javascript = { "node" },
        python = { "python3" },
    },
}

return opts
