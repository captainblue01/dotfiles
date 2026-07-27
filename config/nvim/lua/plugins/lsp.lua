return {
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",

      -- UI
      "onsails/lspkind.nvim",
      "j-hui/fidget.nvim",

      -- Autopairs
      "windwp/nvim-autopairs",
    },
    config = function()
      require("fidget").setup()
      require("mason").setup()

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "html",
          "cssls",
          "intelephense",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.find_git_ancestor,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = "Lua 5.1",
                  },
                  diagnostics = {
                    globals = {
                      "vim",
                      "bit",
                      "it",
                      "describe",
                      "before_each",
                      "after_each",
                    },
                  },
                },
              },
            })
          end,

          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                python = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            })
          end,
        },
      })

      -- Snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Completion
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-Up>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-Down>"] = cmp.mapping.select_next_item(cmp_select),

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              path = "[Path]",
            },
          }),
        },
      })

      -- Command line completion
      cmp.setup.cmdline("/", {
        mapping = {
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "c" }),
          ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "c" }),
        },
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = {
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
          ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "c" }),
          ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "c" }),
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- Diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Autopairs
      local npairs = require("nvim-autopairs")
      npairs.setup({
        fast_wrap = {},
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
