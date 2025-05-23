---@type LazyKeysSpec[]
local keys = {
    { "<leader>sh", desc = "Split (standard geometry) or Merge (visual prompt if ambiguous)" },
    { "<leader>sj", desc = "Split (standard geometry) or Merge (visual prompt if ambiguous)" },
    { "<leader>sk", desc = "Split (standard geometry) or Merge (visual prompt if ambiguous)" },
    { "<leader>sl", desc = "Split (standard geometry) or Merge (visual prompt if ambiguous)" },
    { "<leader>tt", desc = "Open terminal in current window" },
    { "<leader>sd", desc = "Close current split" },
    { "<leader>so", desc = "Close all other splits" },
    { "<leader>sa", desc = "Close all splits (keep one)" },
    { "<leader>bd", desc = "Close buffer (smart)" },
    { "<leader>bo", desc = "Close other buffers" },
    { "<leader>ba", desc = "Close all buffers" },
    { "<C-h>", desc = "Navigate prev/next buffer (skips visible in other wins)" },
    { "<C-l>", desc = "Navigate prev/next buffer (skips visible in other wins)" },
    { "<C-k>", desc = "Navigate prev/next buffer (skips visible in other wins)" },
    { "<C-j>", desc = "Navigate prev/next buffer (skips visible in other wins)" },
    { "<C-D-h>", desc = "Navigate between splits (Normal & Terminal modes)" },
    { "<C-D-l>", desc = "Navigate between splits (Normal & Terminal modes)" },
    { "<C-D-j>", desc = "Navigate between splits (Normal & Terminal modes)" },
    { "<C-D-k>", desc = "Navigate between splits (Normal & Terminal modes)" },
    { "<Esc>", mode = "t", desc = "Exit terminal mode" },
    { "<leader>bl", desc = "Move buffer to adjacent split (prompts visually if ambiguous) (R/L/D/U)" },
    { "<leader>bh", desc = "Move buffer to adjacent split (prompts visually if ambiguous) (R/L/D/U)" },
    { "<leader>bj", desc = "Move buffer to adjacent split (prompts visually if ambiguous) (R/L/D/U)" },
    { "<leader>bk", desc = "Move buffer to adjacent split (prompts visually if ambiguous) (R/L/D/U)" },
    { "<leader>bd", desc = "Close current buffer intelligently" },
    { "<leader>bo", desc = "Close all other buffers" },
    { "<leader>ba", desc = "Close all buffers" },
    { "<C-h>", desc = "Go to previous buffer" },
    { "<C-k>", desc = "Go to previous buffer" },
    { "<C-l>", desc = "Go to next buffer" },
    { "<C-j>", desc = "Go to next buffer" },
}

return keys
