local plugin_files = vim.fn.readdir( vim.fn.stdpath( "config" ) .. "/lua/plugins" )

local plugins = {}

for _, file in ipairs( plugin_files ) do
	if file ~= "init.lua" then
		local plugin_spec = require('plugins.'..file:gsub('%.lua$', '')) 
		if plugin_spec ~= nil then
			table.insert(plugins, plugin_spec)
		end
	end
end

return plugins
