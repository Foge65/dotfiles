vim.o.relativenumber = true

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },
})

vim.opt.ignorecase = true

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "BufWritePre" }, {
    pattern = "*",
    callback = function()
        if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
            vim.api.nvim_command('silent update')
        end
    end,
})

vim.o.tabline = "%!v:lua.TabName()"

function TabName()
    local s = ""
    local tabs = vim.api.nvim_list_tabpages()
    local current = vim.api.nvim_get_current_tabpage()

    for _, tab in ipairs(tabs) do
        local win = vim.api.nvim_tabpage_get_win(tab)
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(name, ":t")
        if filename == "" then
            filename = "[No Name]"
        end

        if tab == current then
            s = s .. "%#TabLineSel# > " .. filename .. " < "
        else
            s = s .. "%#TabLine#   " .. filename .. "   "
        end
    end

    return s .. "%#TabNameFill#"
end
