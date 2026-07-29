return {
  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Hunk navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, vim.tbl_extend("force", opts, { expr = true, desc = "Next Hunk" }))

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, vim.tbl_extend("force", opts, { expr = true, desc = "Previous Hunk" }))

        -- Hunk actions
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage Hunk" }))
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset Hunk" }))
        vim.keymap.set("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, vim.tbl_extend("force", opts, { desc = "Stage Hunk" }))
        vim.keymap.set("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, vim.tbl_extend("force", opts, { desc = "Reset Hunk" }))
        vim.keymap.set("n", "<leader>hS", gs.stage_buffer, vim.tbl_extend("force", opts, { desc = "Stage Buffer" }))
        vim.keymap.set("n", "<leader>hR", gs.reset_buffer, vim.tbl_extend("force", opts, { desc = "Reset Buffer" }))
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, vim.tbl_extend("force", opts, { desc = "Undo Stage Hunk" }))
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview Hunk" }))
        vim.keymap.set("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, vim.tbl_extend("force", opts, { desc = "Blame Line" }))
        vim.keymap.set("n", "<leader>hd", gs.diffthis, vim.tbl_extend("force", opts, { desc = "Diff This" }))

        -- Text object
        vim.keymap.set(
          { "o", "x" },
          "ih",
          ":<C-U>Gitsigns select_hunk<CR>",
          vim.tbl_extend("force", opts, { desc = "Select Hunk" })
        )
      end,
    },
  },
}
