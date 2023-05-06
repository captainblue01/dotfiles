local m = {
 "lmburns/lf.nvim", 
  dependencies = {"plenary.nvim", "toggleterm.nvim"}
}

m.init = function ()
  vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>lua require('lf').start()<CR>", { noremap = true })
end
return m
