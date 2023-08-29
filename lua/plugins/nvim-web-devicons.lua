local init_web_devicons = function()
require("nvim-web-devicons").setup({
 color_icons = true,
 default = true,
 strict = true,
 })
 end


return {
	"nvim-tree/nvim-web-devicons",

	init = init_web_devicons
}
