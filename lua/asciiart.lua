local M = {}

function M.LoadAscii()
	math.randomseed(os.time())
	local ascii_dir = vim.fn.stdpath("config") .. "/images/"
	local images = vim.fn.readdir(ascii_dir)
	local collected = {}
	if #images == 0 then
		return {}
	end
	for _, filename in ipairs(images) do
		local full_path = ascii_dir .. tostring(filename)
		if vim.fn.filereadable(full_path) == 1 then
			collected[#collected + 1] = full_path
		end
	end
	local random = math.random(#collected)
	local picked = collected[random]
	vim.print(random)
	if not picked then
		return vim.print("failed to pick file (no file picked)")
	end
	return vim.fn.readfile(picked)
end

return M
