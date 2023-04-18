_G.__CleanSetup = {}
for k, _ in pairs(package.loaded) do
	_G.__CleanSetup[k] = 1
end

require("options")
require("plugins")
require("pluginconfig")
require("mappings")
require("autocmds")

if package.config:sub(1,1) == "\\" then
	require("os.windoze")
else
	require("os.linux")
end

if vim.api.nvim_win_get_option(0, "diff") then
	vim.notify("Yer in diffmode, cunt!", vim.log.levels.INFO)
	vim.api.nvim_set_keymap( "n", "<leader>n", "[c", { noremap = true } )
	vim.api.nvim_set_keymap( "n", "<leader>p", "]c", { noremap = true } )

	vim.api.nvim_set_keymap( "n", "<leader>1", "<CMD>diffget LOCAL<CR>", { noremap = true } )
	vim.api.nvim_set_keymap( "n", "<leader>2", "<CMD>diffget BASE<CR>", { noremap = true } )
	vim.api.nvim_set_keymap( "n", "<leader>3", "<CMD>diffget REMOTE<CR>", { noremap = true } )
end

function ReloadConfig()
	for k, _ in pairs(package.loaded) do
		if _G.__CleanSetup[k] == nil then
			package.loaded[k] = nil
		end
	end

	dofile(vim.env.MYVIMRC)

	vim.notify("configuration reloaded", vim.log.levels.INFO)
end
