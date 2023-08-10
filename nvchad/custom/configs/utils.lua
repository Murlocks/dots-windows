local M = {}

local on_windows = vim.loop.os_uname().version:match("Windows")

M.join_paths = function(...)
	local path_sep = on_windows and "\\" or "/"
	local result = table.concat({ ... }, path_sep)
	return result
end

return M
