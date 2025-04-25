require("lazy").setup({
    spec = {
        { import = "plugins.gruvbox" },
        { import = "plugins.mason" },
        { import = "plugins.gitsigns" },
        { import = "plugins.telescope" },
        { import = "plugins.lspconfig" },
        { import = "plugins.cmp" },
        { import = "plugins.treesitter" },
        { import = "plugins.neotest" },
        { import = "plugins.neotest-java" },
    },
    checker = { enabled = true },
})

