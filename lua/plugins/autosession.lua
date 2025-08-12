return {
    'rmagatti/auto-session',
    config = function()
        require('auto-session').setup {
            auto_session_enabled = true,
            auto_session_root_dir = vim.fn.stdpath('config') .. "/sessions/",
            auto_session_use_git_branch = false,
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_suppress_dirs = { "~/" },
        }
    end
}

