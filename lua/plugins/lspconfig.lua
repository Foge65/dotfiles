return {
    "neovim/nvim-lspconfig",
    config = function()
        local home = os.getenv("HOME")
        require("lspconfig").jdtls.setup({
            cmd = {
                'java',
                '-javaagent:' .. vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
                '-jar', vim.fn.glob(home ..
                '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
                '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
                '-data', vim.fn.expand('~/.cache/jdtls-workspace/') .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
            },
        })

        require("lspconfig").ts_ls.setup({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            root_dir = function(fname)
                return require("lspconfig.util").root_pattern("package.json", "yarn.lock", "tsconfig.json", ".git")(
                        fname)
                    or vim.loop.cwd()
            end,
        })

        require('lspconfig').clangd.setup({
            cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
            init_options = {
                fallbackFlags = { '-std=c++17' },
            },
        })

        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                }
            }
        })
    end
}
