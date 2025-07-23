return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config('ltex_plus', {
				settings = {
					ltex = {
						language = "en-GB",
						dictionary = { ["en-GB"] = { "Neovim", "ltex-plus", "nvim", "gantt" } },
						disabledRules = { ["en-GB"] = { "WHITESPACE_RULE", "OXFORD_SPELLING_Z_NOT_S" } },
						additionalRules = { enablePickyRules = true },
					},
				},
			})

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = {
								'vim',
							},
						},
					},
				},
			})

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- a bullet at the start of each message
					source = "always", -- show which linter / server it came from
				},
				severity_sort = true,
				signs = true, -- enable gutter signs
				underline = true, -- underline problematic code
				update_in_insert = false, -- don’t update diagnostics while typing
				float = {     -- when you do vim.diagnostic.open_float()
					border = "rounded",
					source = "always",
				},
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method('textDocument/implementation') then
						-- Create a keymap for vim.lsp.buf.implementation ...
					end

					-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
					if client:supports_method('textDocument/completion') then
						-- Optional: trigger autocompletion on EVERY keypress. May be slow!
						-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
						-- client.server_capabilities.completionProvider.triggerCharacters = chars

						vim.lsp.completion.enable(true, client.id, args.buf)
					end

					-- Auto-format ("lint") on save.
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
					if not client:supports_method('textDocument/willSaveWaitUntil')
						and client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	}
}
