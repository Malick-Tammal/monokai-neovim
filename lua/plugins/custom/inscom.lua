-----------------------------------------------------------
--  HACK: Incscom
-----------------------------------------------------------

local function set_comment(lines)
    local window_number = 0
    local buffer_number = vim.api.nvim_win_get_buf(window_number)
    local row, col = unpack(vim.api.nvim_win_get_cursor(window_number))
    local line_count = 0
    vim.api.nvim_buf_set_lines(buffer_number, row, row, false, lines)
    for _ in pairs(lines) do
        line_count = line_count + 1
    end
    vim.api.nvim_win_set_cursor(window_number, { row + line_count, 0 })
end

local function header(opts)
    local opts = opts or {}
    local filetype = vim.bo.filetype
    print(filetype)

    -- INFO: Lua
    if filetype == "lua" then
        local function style_1()
            local template = "-----------------------------------------------------------"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "-- " .. heading })
                end
            end
        end

        local function style_2()
            local template = "--//---------------------------------------------------//--"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "-- " .. heading })
                end
            end
        end

        local function style_3()
            local template = "--"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "-- " .. heading })
                end
            end
        end

        if opts.style == "style-1" then
            style_1()
        elseif opts.style == "style-2" then
            style_2()
        elseif opts.style == "style-3" then
            style_3()
        else
            style_1()
        end

        -- INFO: Javascript or React
    elseif
        filetype == "javascript" or
        filetype == "javascriptreact" or
        filetype == "jsonc" or
        filetype == "rasi"
    then
        local function style_1()
            local template = "//---------------------------------------------------------"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "//-- " .. heading })
                end
            end
        end

        local function style_2()
            local template = "/*-------------------------------------------------------*/"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "//-- " .. heading })
                end
            end
        end

        local function style_3()
            local template = "//"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "//-- " .. heading })
                end
            end
        end

        if opts.style == "style-1" then
            style_1()
        elseif opts.style == "style-2" then
            style_2()
        elseif opts.style == "style-3" then
            style_3()
        else
            style_1()
        end

        -- INFO: TOML / ZSH / BASH
    elseif
        filetype == "toml" or
        filetype == "zsh" or
        filetype == "sh" or
        filetype == "conf" or
        filetype == "hyprlang"
    then
        local function style_1()
            local template = "#----------------------------------------------------------"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "#-- " .. heading })
                end
            end
        end

        local function style_2()
            local template = "#-//---------------------------------------------------//-#"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "#-- " .. heading })
                end
            end
        end

        local function style_3()
            local template = "#"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "#-- " .. heading })
                end
            end
        end

        if opts.style == "style-1" then
            style_1()
        elseif opts.style == "style-2" then
            style_2()
        elseif opts.style == "style-3" then
            style_3()
        else
            style_1()
        end


        -- INFO: CSS / SCCS
    elseif
        filetype == "css" or
        filetype == "scss"
    then
        local function style_1()
            local template = "/*----------------------------------------------------------*/"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "/*-- " .. heading .. " --*/" })
                end
            end
        end

        local function style_2()
            local template = "/*-//---------------------------------------------------//-*/"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "/*-- " .. heading .. " --*/" })
                end
            end
        end

        local function style_3()
            local template = "/*"
            local heading = vim.fn.input("Heading :")
            for i = 1, 2 do
                set_comment({ template })
                if i == 1 then
                    set_comment({ "/*-- " .. heading })
                end
            end
        end

        if opts.style == "style-1" then
            style_1()
        elseif opts.style == "style-2" then
            style_2()
        elseif opts.style == "style-3" then
            style_3()
        else
            style_1()
        end
    else
        print('"' .. filetype .. '"' .. " is unsupported!")
    end
end

local inscome = {}

local config = {
    style = "style-1",
}

inscome.setup = function(opts)
    header(opts or config)
end

return inscome
