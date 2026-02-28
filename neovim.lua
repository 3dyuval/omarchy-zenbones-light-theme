return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg = "#0c0912"
        colors.bg_dark = "#14121a"
        colors.fg = "#ffffff"
        colors.purple = "#b39aff"
        colors.magenta = "#b39aff"
        colors.blue = "#6c3bff"
        colors.cyan = "#827a89"
        colors.green = "#22ff73"
        colors.yellow = "#f9b44e"
        colors.red = "#f66f81"
        colors.orange = "#f9b44e"
        colors.border = "#3b3440"
        colors.comment = "#827a89"
        colors.git = { change = "#f9b44e", add = "#22ff73", delete = "#f66f81" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
