return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<Space>n", "<cmd>NvimTreeFocus<cr>", desc = "NeoTree" },
		},
		opts = {
			actions = {
				open_file = {
					window_picker = {
						enable = true,
						picker = function()
							-- Determine the last-accessed window’s number according to Neovim
							local prev_win_num = vim.fn.winnr('#')
							print(prev_win_num)
							-- If 0 is returned, it means there is no valid “previous” window

							if prev_win_num == 0 then
								-- No window to return. I think this falls back to the default behavior
								return 0
							end

							-- Convert the window number to its actual window ID
							local prev_win_id = vim.fn.win_getid(prev_win_num)
							return prev_win_id
						end,
					}
				}
			}
		},
		config = function(_, opts)
			vim.g.loaded_netrw = true
			vim.g.loaded_netrwPlugin = true
			require("nvim-tree").setup(opts)
		end,
	}
}
