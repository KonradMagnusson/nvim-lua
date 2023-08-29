local plugin_files = vim.fn.readdir( vim.fn.stdpath( "config" ) .. "/lua/plugins" )

local plugins = {}

for _, file in ipairs( plugin_files ) do
	--if file =~ "\.lua$" and file ~= "init.lua" then
	if file ~= "init.lua" then
		table.insert(plugins, require('plugins.'..file:gsub('%.lua$', '')))
	end
end

return plugins
