require("lazy-bootstrap")
vim.g.mapleader = ','
require("lazy-plugins")


local utils = require("qnrd-utils")
local lazy_config = require("lazy.core.config")
local lazy_utils = require("lazy.core.util")

utils.autocmd( { "User"  }, {
	pattern = "LazyVimStarted",
	callback = function( _ )
		for _, plugins in ipairs( lazy_config.spec.modules ) do -- Hack the First: I only have one module of specs: plugins
			lazy_utils.lsmod( plugins, function( modname, path )
				utils.spec_mtimes[ path ] = vim.uv.fs_stat( path ).mtime.sec
			end )
		end
	end
} )

utils.autocmd( { "User"  }, {
	pattern = "LazyReload",
	callback = function( _ )
		local new_mtimes = {}
		for _, module in ipairs(lazy_config.spec.modules ) do -- Hack the First born again
			lazy_utils.lsmod( module, function( _, path )
				new_mtimes[ path ] = vim.uv.fs_stat( path ).mtime.sec
			end )
		end

		for spec_path, mtime in pairs( new_mtimes ) do
			if mtime ~= utils.spec_mtimes[ spec_path ] then
				local filename = spec_path:match( "^.*/(.*)$" )
				local sans_ext = filename:match( "^(.*).lua$")

				if filename == "init.lua" then -- Hack the Second: I set up some of my config files as fake plugin specs, e.g. core.autocmds
					filename = spec_path:match( "^.*/(.*)/init.lua$" )
					sans_ext = filename
				end

				local cmd  = "Lazy reload "
				if sans_ext:match( "^core%..*" ) then -- because of Hack the Second
					cmd = cmd .. sans_ext
				else
					-- Hack the Third: a module doesn't know the name of the plugin. The plugin spec does though! Require and ask it.
					local old_path = package.path
					package.path = vim.env.HOME .. ".config/nvim/lua/plugins/?.lua;" .. package.path
					local spec_name = require("plugins." .. sans_ext)[1]:gsub( ".*/", "" )
					package.path = old_path
					cmd = cmd .. spec_name
				end
				vim.cmd( cmd )
			end
		end
		utils.spec_mtimes = new_mtimes
		if utils.__map_dirty then
			vim.api.nvim_exec_autocmds( "User", { pattern = "Remap" } )
		end
	end
} )
