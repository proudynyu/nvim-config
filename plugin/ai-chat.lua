local M = {}

-- local ai_model = "llama3"

local state = {
    chat = {
        buf = -1,
        win = -1,
        row = 0,
        col = 0
    },
    input = {
        buf = -1,
        win = -1
    }
}

function M.send_prompt(prompt, callback)
    callback(prompt)
    -- local json = vim.fn.json_encode({
    --     model = ai_model,
    --     message = {
    --         {
    --             role = "user",
    --             content = prompt
    --         }
    --     }
    -- })
    --
    -- local output = {}
    -- local stderr = {}
    --
    -- -- for a local LLM
    -- local job_id = vim.fn.jobstart(
    --     { "curl", "-s", "http://localhost:11434/api/chat", "-d", json },
    --     {
    --         stdout_buffered = true,
    --         stderr_buffered = true,
    --
    --         on_stdout = function(_, data)
    --             if data then
    --                 for _, line in ipairs(data) do
    --                     if line ~= "" then
    --                         table.insert(output, line)
    --                     end
    --                 end
    --             end
    --         end,
    --
    --         on_stderr = function(_, data)
    --             if data then
    --                 for _, line in ipairs(data) do
    --                     table.insert(stderr, line)
    --                 end
    --             end
    --         end,
    --
    --         on_exit = function()
    --             if #stderr > 0 then
    --                 vim.notify("Ollama error: " .. table.concat(stderr, "\n"), vim.log.levels.ERROR)
    --             else
    --                 local full = table.concat(output, "")
    --                 local ok, parsed = pcall(vim.fn.json_decode, full)
    --                 if ok and parsed and parsed.message then
    --                     callback(parsed.message.content)
    --                 else
    --                     vim.notify("Failed to parse LLM response", vim.log.levels.WARN)
    --                 end
    --             end
    --         end
    --     })
end

function M.create_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)
    local col = math.floor(( vim.o.columns - width ) / 2)
    local row = math.floor(( vim.o.lines - height) / 2 )

    local buf = nil
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    vim.bo[buf].bufhidden = "hide"
    vim.bo[buf].filetype = "floatingchat"
    vim.bo[buf].modifiable = false

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)
    vim.wo[win].wrap = true
    vim.wo[win].number = false
    vim.wo[win].signcolumn = "no"

    return { buf = buf, win = win, row = row, col = col, width = width }
end

function M.create_input_window(parent, opts)
    local buf = nil
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    vim.bo[buf].buftype = "prompt"
    vim.bo[buf].bufhidden = "wipe"
    vim.fn.prompt_setprompt(buf, "You: ")
    vim.cmd("startinsert")

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = parent.width,
        height = 1,
        col = parent.col,
        row = parent.row,
        style = "minimal",
        border = "single"
    })

    return { buf = buf, win = win }
end

function M.setup_input_handler(input_buf, chat_buf)
    vim.fn.prompt_setcallback(input_buf, function(text)
        if text == "" then return end

        vim.api.nvim_buf_set_lines(input_buf, 0, -1, false, { "" })
        vim.bo[input_buf].modified = false

        local function append(role, msg)
            local prefix = role == "user" and "You: " or "Bot: "
            local lines = vim.split(msg, "\n", { trimempty = true })
            lines[1] = prefix .. lines[1]

            vim.api.nvim_buf_set_option(chat_buf, "modifiable", true)
            vim.api.nvim_buf_set_lines(chat_buf, -1, -1, false, lines)
            vim.api.nvim_buf_set_option(chat_buf, "modifiable", false)
        end

        append("user", text)

        M.send_prompt(text, function(response)
            append("bot", response)
        end)
    end)
end

function M.toggle_chat()
    if not vim.api.nvim_win_is_valid(state.chat.win) then
        state.chat = M.create_window { buf = state.chat.buf }
        state.input = M.create_input_window(state.chat, { buf = state.input.buf })
    else
        M.hide_windows()
    end

    M.setup_input_handler(state.input.buf, state.chat.buf)
end

function M.hide_windows()
    if vim.api.nvim_win_is_valid(state.chat.win) then
        vim.api.nvim_win_hide(state.input.win)
        vim.api.nvim_win_hide(state.chat.win)
    end
end

vim.api.nvim_create_user_command("ChatLLM", function()
    M.toggle_chat()
end, {})

vim.keymap.set("i", "<Esc>", function()
    vim.cmd("stopinsert")
    M.hide_windows()
end, { buffer = state.input.buf })

vim.keymap.set("n", "<Esc>", M.hide_windows)

return M
