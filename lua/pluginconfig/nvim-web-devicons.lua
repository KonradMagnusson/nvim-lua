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
  },
  lua = {
    icon = "L",
    color = "#428850",
    cterm_color = "65",
    name = "lua"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
};
