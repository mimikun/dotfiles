local Hydra = require("hydra")
Hydra({
    name = "Bookmarks",
    mode = "n",
    body = "<leader>m",
    hint = [[
  Bookmark Navigation

  ^  _j_: Next in List     _J_: Next Bookmark
  ^  _k_: Prev in List     _K_: Prev Bookmark
  ^
  ^ _<Esc>_: Exit
  ]],
    heads = {
        { "j", "<cmd>BookmarksGotoNextInList<cr>" },
        { "k", "<cmd>BookmarksGotoPrevInList<cr>" },
        { "J", "<cmd>BookmarksGotoNext<cr>" },
        { "K", "<cmd>BookmarksGotoPrev<cr>" },
    },
})
