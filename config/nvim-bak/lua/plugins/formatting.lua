return {
	"stevearc/conform.nvim",
	dependencies = {
		{ "zapling/mason-conform.nvim" },
		{ "williamboman/mason.nvim" },
	},

	config = function()
		local conform = require("conform")
		local mason_conform = require("mason-conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 5000,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
		})

		-- Install formaters
		mason_conform.setup({
			ensure_installed = {
				"stylua",
				"black",
				"prettier",
				-- "pretty-php",
				-- "php_cs_fixer",
				-- "phpcs",
			},
		})

		-- add the leader lf format key
		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Forna  file or range (in visual mode)" })
	end,
}
