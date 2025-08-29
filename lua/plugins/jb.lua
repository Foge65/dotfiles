return {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd("colorscheme jb")
        vim.opt.colorcolumn = "121"
        vim.cmd("highlight ColorColumn guibg=#2a2e36")
    end,
}
