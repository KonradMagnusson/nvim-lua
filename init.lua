_G.__CleanSetup = {}
for k, _ in pairs(package.loaded) do
	_G.__CleanSetup[k] = 1
end

require("options")
require("plugins")
require("pluginconfig")
require("mappings")
require("autocmds")


function ReloadConfig()
	for k, _ in pairs(package.loaded) do
		if _G.__CleanSetup[k] == nil then
			package.loaded[k] = nil
		end
	end

	dofile(vim.env.MYVIMRC)

	vim.notify("configuration reloaded", vim.log.levels.INFO)
end
