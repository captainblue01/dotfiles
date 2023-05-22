local m = {"lukas-reineke/indent-blankline.nvim"}

m.init = function ()
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
  }
end

return m
