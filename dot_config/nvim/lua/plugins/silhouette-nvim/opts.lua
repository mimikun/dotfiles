---@type table
local opts = {
    task = {
        repetition_tasks_path = "./repetition-tasks.md",
        holidays_path = "./holidays.md",
    },
    timer = {
        time_storage_path = "./time-storage.json",
        check_box_mark = {
            recording = "~",
            stop = " ",
        },
    },
}

return opts
