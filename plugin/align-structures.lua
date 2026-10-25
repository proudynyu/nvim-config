vim.api.nvim_create_user_command("Align", function(opts)
    local sep = opts.args
    if sep == "" then
        sep = "="
    end

    local start = vim.fn.line("'<")
    local finish = vim.fn.line("'>")
    if start > finish then 
        start, finish = finish, start
    end
    local lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)

    local max = 0

    for _, line in ipairs(lines) do
        local i = line:find(sep, 1, true) -- plain text search
        if i then
            local left = line:sub(1, i - 1):gsub("%s+$", "")
            max = math.max(max, #left)
        end
    end

    for i, line in ipairs(lines) do
        local pos = line:find(sep, 1, true)
        if pos then
            local left = line:sub(1, pos - 1):gsub("%s+$", "")
            local right = line:sub(pos + #sep):gsub("^%s+", "")
            lines[i] = string.format("%-" .. max .. "s %s %s", left, sep, right)
        end
    end

    vim.api.nvim_buf_set_lines(0, start - 1, finish, false, lines)
end, {
    nargs = "?",
})

vim.keymap.set('v', "<leader>al", function ()
   local sep = vim.fn.input("Align on: ")
   vim.cmd(":Align " .. sep)
end)
