local luavim = require('themes.luavim')

require('tokyonight').setup({
  style = "night",

  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors)
    colors.border = "#1A1B26"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- fucntion will be called with a Highlights and ColorScheme table
  -- on_highlights = function(highlights, colors) end,
  on_highlights = function(hl, c)

    local primary = luavim.primary
    local secondary = luavim.secondary

    local none = "NONE"

    hl.LuavimPrimary = {
      fg = primary
    }
    hl.LuavimSecondary = {
      fg = secondary
    }

    -- Telescope
    hl.TelescopeTitle = {
      fg = primary
    }

    hl.LuavimHeader = {
      fg = primary
    }
    hl.LuavimHeaderInfo = {
      fg = secondary
    }
    hl.LuavimFooter = {
      fg = secondary
    }

    hl.WhichKeyFloat = {
      bg = none,
      fg = none
    }
    hl.WhichkeyBorder = {
      bg = none,
      fg = secondary
    }
    hl.LspInlayHint = {
      bg = none
    }

    --
    -- hl.TelescopeTitle = {
    --   fg = prompt,
    -- }
    -- hl.TelescopeNormal = {
    --   bg = none,
    --   fg = none,
    -- }
    -- hl.TelescopeBorder = {
    --   bg = none,
    --   fg = text
    -- }
    -- hl.TelescopeMatching = {
    --   fg = prompt
    -- }
    -- hl.MsgArea = {
    --   fg = c.fg_dark
    -- }
  end,
})

vim.cmd('colorscheme tokyonight')
