return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    cond = not vim.g.vscode,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      ts.install({
        "python",
        "lua",
        "c",
        "vim",
        "vimdoc",
        "query",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "css",
        "make",
        "markdown",
        "markdown_inline",
        "php",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "python",
          "lua",
          "c",
          "vim",
          "html",
          "css",
          "make",
          "markdown",
          "php",
          "gitcommit",
        },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    cond = not vim.g.vscode,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
}
