return {
    "lazymaniac/wttr.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        location = "Nagoya",
        format = 4,
        custom_format = "%C+%cP:%p+T:%t+F:%f+%w+%m+%P+UV:%u+Hum:%h",
        units = "M",
        lang = "ja",
        forecast_type = "rich_text",
    },
    --cond = false,
}
