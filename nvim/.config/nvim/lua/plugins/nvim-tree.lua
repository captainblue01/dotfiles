local m = { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } }

-- mappings = {
--   custom_only = false,
--   list = {
--     { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
--     { key = "h",                  cb = tree_cb("close_node") },
--     { key = "v",                  cb = tree_cb("vsplit") },
--   },
-- },
local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical,opts('Open: Vertical Split'))
  vim.keymap.set("n", "h", api.node.open.horizontal,opts('Open: Horizontal Split'))
end

m.init = function()
  -- Disables netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  local nvim = require("nvim-tree")
  local tree_cb = require("nvim-tree.config").nvim_tree_callback
  nvim.setup({
    on_attach = on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    -- ignore_ft_on_setup = {
    --     "startify",
    --     "dashboard",
    --     "alpha",
    -- },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    hijack_directories = {
      enable = false,
      auto_open = false,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = "left",
      number = false,
      relativenumber = false,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
      },
    },
  })
end

return m
