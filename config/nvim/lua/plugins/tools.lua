return {
  {
      "lambdalisue/suda.vim",
      cond = not vim.g.vscode,
  },
  {
      "mbbill/undotree",
      cond = not vim.g.vscode,
  },
  {
		"famiu/bufdelete.nvim",
		cond = not vim.g.vscode,
	},
}

