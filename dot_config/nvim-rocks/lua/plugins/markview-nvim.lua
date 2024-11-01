local markview = require("markview")

markview.setup({
    headings = require("markview.presets").headings.glow_labels,
})

-- default off
markview.commands.disableAll()
