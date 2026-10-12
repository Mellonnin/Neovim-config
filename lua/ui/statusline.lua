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


local function filename()
    local path = vim.fn.expand("%:p:h") --[[@as string]]
    path = path:gsub("oil://", "")
    path = vim.fs.joinpath(path, "") --
        :gsub("^" .. vim.pesc(vim.fs.joinpath(vim.fn.getcwd(0, 0), "")), "")

    local name = vim.fn.expand("%:p:t") --[[@as string]]
    return path .."/" .. name
end


local function gitsigns()
  -- Check if gitsigns is loaded and the data exists for the buffer
  local gitsigns_dict = vim.b.gitsigns_status_dict
  if not gitsigns_dict or vim.tbl_isempty(gitsigns_dict) then
    return ""
  end
  -- conflict_count({bufnr})

  local added = gitsigns_dict.added or 0
  local changed = gitsigns_dict.changed or 0
  local removed = gitsigns_dict.removed or 0

  -- Format the string (adjust icons/colors as you like)
  local stat = string.format("+%d ~%d -%d", added, changed, removed)
  return stat
end

function _G._statusline()
	local branch = vim.b.git_branch .. " %*" or ""
	-- local path = vim.b.rel_path or "%f"

	local diag = ""
	local counts = vim.diagnostic.count(0) or {}
	local labels = {"󰅚 :","󰀪 :", "󰋽 :","󰌶:"}
    -- "E:", "W:", "I:", "H:" }
	-- local hls = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" }
	for i = 1, 4 do
		if counts[i] and counts[i] > 0 then
			diag = diag .. "%#" .. "#" .. labels[i] .. counts[i] .. "%* "
		end
	end

    return table.concat({
      "  %*",
      branch,
      " ",
      filename(),
      "  ",
      gitsigns(),
      "%=",
      diag,
      "  ",
      "[",
      harpoon_status(),
      "]",
      "  %l:%c  ",
      "%P",
      "  ",
    })








end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+$", "")
		if root ~= "" then
			vim.b.git_branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("%s+$", "")
			vim.b.rel_path = vim.fn.expand("%:p"):sub(#root + 2)
		else
			vim.b.git_branch = nil
			vim.b.rel_path = vim.fn.expand("%:p:~")
		end
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.cmd("redrawstatus!")
	end,
})

vim.o.statusline = "%!v:lua._statusline()"
