return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                sql = { "sql-formatter" },
            },
            formatters = {
                ["sql-formatter"] = {
                    command = "sql-formatter",
                    args = { "--language", "postgresql" },
                    stdin = true,
                },
            },
            format_on_save = false,
        })

        vim.keymap.set("n", "<leader>f", function()
            conform.format({ async = true })
        end, { desc = "Format buffer" })

        vim.api.nvim_create_user_command("FormatSQL", function()
            local start_pos = vim.fn.getpos("'<")
            local end_pos = vim.fn.getpos("'>")
            local bufnr = vim.api.nvim_get_current_buf()

            local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2] - 1, end_pos[2], false)
            if #lines == 0 then return end

            -- Сохраняем отступ первой строки
            local first_indent = lines[1]:match("^%s*") or ""

            -- Удаляем обратные кавычки
            lines[1] = lines[1]:gsub("^%s*`", "")
            lines[#lines] = lines[#lines]:gsub("`%s*$", "")

            -- Заменяем шаблоны ${...} на уникальные плейсхолдеры
            local placeholders = {}
            local placeholder_index = 1

            for i, line in ipairs(lines) do
                lines[i] = line:gsub("%${(.-)}", function(code)
                    local key = "__PLACEHOLDER_" .. placeholder_index .. "__"
                    placeholders[key] = "${" .. code .. "}"
                    placeholder_index = placeholder_index + 1
                    return key
                end)
            end

            -- Пишем во временный файл
            local tmp = os.tmpname() .. ".sql"
            local f = io.open(tmp, "w")
            f:write(table.concat(lines, "\n"))
            f:close()

            -- Запускаем sql-formatter
            local handle = io.popen("sql-formatter --language postgresql " .. tmp)
            local formatted = handle:read("*a")
            handle:close()

            local formatted_lines = vim.split(formatted, "\n")

            -- Восстанавливаем отступ
            for i, line in ipairs(formatted_lines) do
                if line:match("%S") then
                    formatted_lines[i] = first_indent .. line
                else
                    formatted_lines[i] = ""
                end
            end

            -- Возвращаем плейсхолдеры `${...}` обратно
            for i, line in ipairs(formatted_lines) do
                for key, original in pairs(placeholders) do
                    line = line:gsub(key, original)
                end
                formatted_lines[i] = line
            end

            -- Убираем пустые строки с конца
            while #formatted_lines > 0 and formatted_lines[#formatted_lines]:match("^%s*$") do
                table.remove(formatted_lines, #formatted_lines)
            end

            -- Вставляем обратно
            vim.api.nvim_buf_set_lines(bufnr, start_pos[2] - 1, end_pos[2], false, formatted_lines)
            vim.notify("Formatted with sql-formatter")
        end, { range = true, desc = "Format SQL inside JS template string", })

        vim.api.nvim_set_keymap("v", "<leader>fs", ":FormatSQL<CR>",
            { noremap = true, silent = true, desc = "Formart SQL syntax" })
    end,
}
