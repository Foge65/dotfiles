return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "rcasia/neotest-java",
    },
    keys = {
        { "<leader>ts", "<cmd>Neotest summary<cr>", desc = "Toggle Neotest summary" },
        { "<leader>tf", "<cmd>Neotest run<cr>",     desc = "Run tests in current file" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-java")({
                    dap = { justMyCode = false },
                }),
            },
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "NeotestSummaryOpened",
            callback = function()
                require("neotest").run.run(vim.fn.getcwd())
            end
        })
    end,
}
