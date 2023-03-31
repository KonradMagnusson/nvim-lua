require("telescope").setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
})

require("telescope").load_extension("command_center")



require("nvim-web-devicons").setup {
 override = {
  cpp = {
    icon = "C",
    color = "#428850",
    cterm_color = "65",
    name = "cpp"
  },
  h = {
    icon = "H",
    color = "#428850",
    cterm_color = "65",
    name = "h"
  },
  inl = {
    icon = "I",
    color = "#428850",
    cterm_color = "65",
    name = "inl"
  }
 };
}
