return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "light"
      vim.g.zenbones = { lightness = "dim" }
    end,
    config = function()
      local palette = require("zenbones.palette").light
      local fg = palette.fg
      local function apply()
        -- h1 = darkest (most prominent), h6 = lightest, staggered from fg
        local shades = {
          fg.hex,
          fg.lighten(5).hex,
          fg.lighten(10).hex,
          fg.lighten(15).hex,
          fg.lighten(20).hex,
          fg.lighten(25).hex,
        }
        -- bg: use fg as a subtle tint, very light
        local bg_base = fg
        for i, color in ipairs(shades) do
          vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i,                 { fg = color, bold = true })
          vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i .. "Bg",         { bg = bg_base.lighten(60 + i * 4).hex })
          vim.api.nvim_set_hl(0, "@markup.heading." .. i .. ".markdown", { fg = color, bold = true })
        end
      end
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function() vim.schedule(apply) end,
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.md",
        once = true,
        callback = function() vim.schedule(apply) end,
      })
      vim.schedule(apply)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
    },
  },
}
