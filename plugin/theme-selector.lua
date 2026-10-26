local colors = require("config.plugins.colors")

local ColorSwitcher = {}

local config = {
    colors = {}
}

local function get_stage_file()
    return vim.fn.stdpath("data") .. "/theme_switcher_data.json"
end

local function load_persisted_theme()
    local file_path = get_stage_file()
    local file = io.open(file_path, "r")
    if not file then return nil end

    local content = file:read("*a")
    file:close()

    local ok, decoded = pcall(vim.json.decode, content)
    if ok and decoded and decoded.theme then
        return decoded.theme
    end
    return nil
end

local function set_loaded_theme()
    local saved_theme = load_persisted_theme()
    if saved_theme then
        local ok, _ = pcall(vim.cmd, "colorschem " .. saved_theme)
        if not ok then
            vim.notify("Failed to load saved theme: " .. saved_theme, vim.log.level.WARN)
        end
    end
end

local function save_persisted_theme(theme_name)
    local file_path = get_stage_file()
    local file = io.open(file_path, "w")

    if file then
        local data = vim.json.encode({theme = theme_name})
        file:write(data)
        file:close()
    end
end

--- @param str string
--- @param sep string
--- @return table
function ColorSwitcher.string_split(str, sep)
    if sep == nil then
        return {}
    end

    local t = {}
    for s in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, s)
    end
    return t
end

--- @param theme string
--- @return string|nil
function ColorSwitcher.parse_theme_name(theme)
    local package = ColorSwitcher.string_split(theme, "/")
    if not package[2] then return theme end
    local t = ColorSwitcher.string_split(package[2], ".")
    return t[1]
end

function ColorSwitcher.load_colors()
    local themes = {}
    for _, value in ipairs(colors) do
        if value[1] then
            local name = ColorSwitcher.parse_theme_name(value[1])
            if name ~= nil then
                table.insert(themes, name)
            end
        end
    end
    return themes
end

function ColorSwitcher.create_window(themes)
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, themes)

    local width = 30
    local height = math.max(#themes, 1)
    local ui = vim.api.nvim_list_uis()[1]
    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width - width) / 2)

    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
        title = "Select theme",
        title_pos = "center"
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    return buf, win
end

function ColorSwitcher.apply_selected_theme(buf, win)
    local selected_theme = ColorSwitcher.get_theme_under_cursor(buf, win)

    if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
    end

    if selected_theme and selected_theme ~= "" then
        local ok, _ = pcall(vim.cmd, "colorscheme " .. selected_theme)
        if ok then
            save_persisted_theme(selected_theme)
        else
            vim.notify("Failed to load theme: " .. selected_theme, vim.log.levels.ERROR)
        end
    end
end

function ColorSwitcher.setup(user_config)
    config = vim.tbl_deep_extend("force", config, user_config or {})
end

function ColorSwitcher.close_win(win, original_theme)
    if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
    end
    if original_theme then
        pcall(vim.cmd, "colorscheme " .. original_theme)
    end
end

function ColorSwitcher.get_theme_under_cursor(buf, win)
    local cursor_pos = vim.api.nvim_win_get_cursor(win)
    local line_num = cursor_pos[1]

    local lines = vim.api.nvim_buf_get_lines(buf, line_num - 1, line_num, false)
    return lines[1]
end

function ColorSwitcher.preview(buf, win)
    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = buf,
        callback = function()
            local theme = ColorSwitcher.get_theme_under_cursor(buf, win)
            if theme and theme ~= "" then
                pcall(vim.cmd, "colorscheme " .. theme)
            end
        end
    })
end

function ColorSwitcher.open_picker()
    local themes = ColorSwitcher.load_colors()

    if #themes == 0 then
        vim.notify("No themes configured in config.plugins.colors", vim.log.level.WARN)
        return
    end

    local original_theme = vim.g.colors_name

    local buf, win = ColorSwitcher.create_window(themes)
    local opts = { buffer = buf, silent = true }

    ColorSwitcher.preview(buf, win)

    vim.keymap.set("n", "<CR>", function() ColorSwitcher.apply_selected_theme(buf, win) end, opts)
    vim.keymap.set("n", "q", function() ColorSwitcher.close_win(win, original_theme) end, opts)
    vim.keymap.set("n", "<Esc>", function() ColorSwitcher.close_win(win, original_theme) end, opts)
end

set_loaded_theme()
vim.keymap.set("n", "<leader>cc", function() ColorSwitcher.open_picker() end, { desc = "Open theme switcher" })

return ColorSwitcher
