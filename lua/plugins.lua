require("lazy").setup({
	spec = {
		--{ import = "plugins.gruvbox" },
		{ import = "plugins.tokyonight" },
		{ import = "plugins.mason" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.telescope" },
		{ import = "plugins.lspconfig" },
		{ import = "plugins.cmp" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.neotest" },
		{ import = "plugins.neotest-java" },
		{ import = "plugins.nerdtree" },
		{ import = "plugins.which-key" },
		{ import = "plugins.sqls" },
	},
	checker = { enabled = true },
})

