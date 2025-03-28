---@type string
local bash_formatter = require("config.global").is_linux == 1 and "bracketed_pasting" or "trim_empty_lines"

---@type table
local opts = {
    buflisted = true,
    scratch = true,
    ft = "REPL",
    wincmd = "belowright 15 split",
    metas = {
        aichat = {
            cmd = "aichat",
            formatter = "bracketed_pasting",
        },
        radian = {
            cmd = "radian",
            formatter = "bracketed_pasting_no_final_new_line",
        },
        ipython = {
            cmd = "ipython",
            formatter = "bracketed_pasting",
        },
        python = {
            cmd = "python",
            formatter = "trim_empty_lines",
        },
        R = {
            cmd = "R",
            formatter = "trim_empty_lines",
        },
        bash = {
            cmd = "bash",
            formatter = bash_formatter,
        },
        zsh = {
            cmd = "zsh",
            formatter = "bracketed_pasting",
        },
    },
    close_on_exit = true,
    scroll_to_bottom_after_sending = true,
    format_repl_buffers_names = true,
    os = {
        windows = {
            send_delayed_cr_after_sending = true,
        },
    },
}

return opts
