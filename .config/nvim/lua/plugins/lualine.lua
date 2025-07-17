return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = function()
			local opts = {
				theme = "iceberg",
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
			}
			return opts
		end,
	}
}
