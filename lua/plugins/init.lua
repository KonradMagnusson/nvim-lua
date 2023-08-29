local plugin_files = vim.fn.readdir( vim.fn.stdpath( "config" ) .. "/lua/plugins" )

local plugins = {}

local blacklist = { "clangd.lua" }

for _, file in ipairs( plugin_files ) do
	--if not file =~ "\.lua$" then goto continue end
	if file == "init.lua" then goto continue end
	for _, blacklisted in pairs( blacklist ) do
		if file == blacklisted then goto continue end
	end

	table.insert(plugins, require('plugins.'..file:gsub('%.lua$', '')))

	::continue::
end

return plugins
