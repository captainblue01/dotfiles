return {
  {
    "numtostr/comment.nvim",
    cond = not vim.g.vscode,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "andrewferrier/wrapping.nvim",
    cond = not vim.g.vscode,
    config = function()
      require("wrapping").setup()
    end,
  },
}
