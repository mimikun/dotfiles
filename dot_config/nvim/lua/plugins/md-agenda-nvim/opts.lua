---@type table
local opts = {
    agendaFiles = {
        "~/notes/agenda.md",
        --singular files
        "~/notes/habits.md",
        --folders
        "~/notes/agendafiles/",
    },

    --How many days should be in one agenda view page? - default: 10
    agendaViewPageItems = 10,
    --In how many days before the deadline, a reminder for the task should be shown today - default: 30
    remindDeadlineInDays = 30,
    --How many past days should be in the habit view? - default: 24
    habitViewPastItems = 24,
    --How many future days should be in the habit view? -default: 3
    habitViewFutureItems = 3,
    --For folding logbook entries -default: {{{,}}}
    foldmarker = "{{{,}}}",
}

return opts
