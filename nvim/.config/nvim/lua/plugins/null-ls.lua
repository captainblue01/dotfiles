local function generate_spell_config ()
  local file = io.open("~./config/nvim/cspell.json", "r")
  if not file then
    file = io.open("~./config/nvim/cspell.json", "w")
    if file then
      io.close(file)
    end
  end
end

local m = {"jose-elias-alvarez/null-ls.nvim"}
m.init = function ()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  -- Detect if cspell config exists if not it creates blank config
  generate_spell_config()
  null_ls.setup {
    debug = false,
     fallback_severity = vim.diagnostic.severity.HINT,
    sources = {

      -- Python black formatter
      -- https://github.com/psf/black
      formatting.black,

      -- Spell Check
      -- https://github.com/streetsidesoftware/cspell
      diagnostics.cspell.with {
        config = {create_config_file = true, find_json = vim.fn.findfile("~./config/nvim/cspell.json") },
        filetypes = {
          'markdown',
          'html',
          'yaml',
          'typescript',
          'typescriptreact',
          'lua',
          'luau',
          'graphql',
          'scss',
          'less',
          'jsonc',
          'handlebars',
          'markdown.mdx',
          'vue',
          'yaml',
          'json',
          'javascript',
          'javascriptreact',
          'css',
        },
        extra_args = {
          '--config',
          '--cache',
          '--gitignore',
          '--no-gitignore',
          '--locale',
          'en-US',
          '--language-id',
          'companies',
          'softwareTerms',
          'misc',
          'typescript',
          'node',
          'html',
          'python',
          'css',
          'bash',
          'fonts',
          'filetypes',
          'npm',
        },
  },
      code_actions.cspell,
      formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
      -- formatting.yapf,
      formatting.stylua,
      -- diagnostics.flake8, -- Disabled because diagnostic severity was too high
    },
  }
end
return m
