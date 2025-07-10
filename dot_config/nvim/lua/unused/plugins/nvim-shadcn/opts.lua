---@type table
local opts = {
    default_installer = "npm",

    format = {
        doc = "https://ui.shadcn.com/docs/components/%s",
        npm = "npx shadcn@latest add %s",
        pnpm = "pnpm dlx shadcn@latest add %s",
        yarn = "npx shadcn@latest add %s",
        bun = "bunx --bun shadcn@latest add %s",
    },

    keys = {
        i = { doc = "<C-o>" },
        n = { doc = "<C-o>" },
    },

    telescope_config = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
        prompt_title = "Shadcn UI components",
    },
}

return opts
