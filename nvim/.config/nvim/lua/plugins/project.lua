local m = { "ahmedkhalf/project.nvim" }

m.init = function()
  require('telescope').load_extension('projects')
  require("project_nvim").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
  })
  vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>:AddProject<cr>", { noremap = true, silent = true, desc = "Add Project" })
end
return m
