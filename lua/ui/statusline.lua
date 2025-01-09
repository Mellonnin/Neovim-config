-- start stole part from harpoon-lualine
local D = {}

D.lazy_require = function(require_path)
    return setmetatable({}, {
        __index = function(_, key)
            return require(require_path)[key]
        end,

        __newindex = function(_, key, value)
            require(require_path)[key] = value
        end,
    })
end

D.get_full_path = function(root_dir, value)
    if vim.loop.os_uname().sysname == "Windows_NT" then
        return root_dir .. "\\" .. value
    end

    return root_dir .. "/" .. value
end

D.is_relative_path = function(path)
    return string.sub(path, 1, 1) ~= "/"
end

local utils = D
local harpoon = utils.lazy_require "harpoon"

local default_options = {
    indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]" },
    _separator = " ",
    no_harpoon = "Harpoon not loaded",
    color_active = nil,
}


local function status(component)
    local root_dir = harpoon:list().config:get_root_dir()
    local current_file_path = vim.api.nvim_buf_get_name(0)

    local harpoon_items = harpoon:list().items

    local length = math.min(#harpoon_items, #component.indicators)

    local stat = {}

    for i = 1, length do
        local harpoon_item = harpoon_items[i]
        if not harpoon_item then
            return
        end
        local harpoon_path = harpoon_item.value

        local full_path = nil
        if utils.is_relative_path(harpoon_path) then
            full_path = utils.get_full_path(root_dir, harpoon_path)
        else
            full_path = harpoon_path
        end

        local active = full_path == current_file_path
        local indicator = nil
        if active then
            indicator = component.active_indicators[i]
        else
            indicator = component.indicators[i]
        end

        local label = indicator
        if type(indicator) == "function" then
            label = indicator(harpoon_item)
        end

        table.insert(stat, label)
    end

    return table.concat(stat, component._separator)
end

local function harpoon_status()
    local harpoon_loaded = package.loaded["harpoon"] ~= nil
    if not harpoon_loaded then
        return default_options.no_harpoon
    end
    return status(default_options)
end

-- end stole part from harpoon-lualine

-- stole from u/boltlessengineer
local function filename()
    local path = vim.fn.expand("%:p:h") --[[@as string]]
    path = path:gsub("oil://", "")
    path = vim.fs.joinpath(path, "") --
        :gsub("^" .. vim.pesc(vim.fs.joinpath(vim.fn.getcwd(0, 0), "")), "")

    local name = vim.fn.expand("%:p:t") --[[@as string]]
    return path .. name
end

-- start stole from u/shynerd089
local function process_diagnostics(prefix, n)
    local out = prefix .. n
    return out
end

local function get_lsp_diagnostics(bufnr)
    local result = {}
    local levels = {
        errors = vim.diagnostic.severity.ERROR,
        warnings = vim.diagnostic.severity.WARN,
        info = vim.diagnostic.severity.INFO,
        hints = vim.diagnostic.severity.HINT,
    }
    for k, level in pairs(levels) do
        result[k] = #vim.diagnostic.get(bufnr, { severity = level })
    end
    return result
end

local function setup_diagnostics()
    local diagnostics = get_lsp_diagnostics()
    local errors = diagnostics.errors
    local warnings = diagnostics.warnings
    if errors == 0 and warnings == 0 then
        return ""
    else
        return table.concat {
            process_diagnostics(" E:", errors),
            process_diagnostics(" W:", warnings),
        }
    end
end


local function get_branch()
    local branch = vim.fn.systemlist('git branch --show')
    if branch[1] == nil then
        branch = ""
        return branch
    end
    if string.find(branch[1], 'fatal') then
        branch = ""
        return branch
    end
    if branch ~= nil then
        return branch[1]
    end
end
-- start stole from u/shynerd089

function _G.statusline()
    return table.concat({
        filename(),
        "%h%w",
        " ",
        "%m%r",
        "  ",
        get_branch(),
        "%=",
        setup_diagnostics(),
        "  ",
        "[",
        harpoon_status(),
        "]",
        "  ",
        "%-10(%l,%c%V%)",
        " ",
        "%P",
        "  ",
    })
end

vim.o.statusline = "%{%v:lua._G.statusline()%}"
