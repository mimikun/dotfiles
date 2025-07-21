---@type OrgConfigOpts
local opts = {
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
    org_todo_keywords = {
        "TODO(t)",
        "NEXT(n)",
        "|",
        "DONE(d)",
    },
    -- day/week/month/year/number of days
    org_agenda_span = "week",
    -- start from today + this modifier
    org_agenda_start_day = nil,
}

return opts
