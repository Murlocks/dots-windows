return {
  {
    "folke/noice.nvim",
    tag = "v4.4.7",
    opts = {
      -- Position the command popup at the center of the screen
      -- See https://github.com/folke/noice.nvim/blob/0cbe3f88d038320bdbda3c4c5c95f43a13c3aa12/lua/noice/types/nui.lua#L6
      -- See https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
      ---@type NoiceConfigViews
      views = {
        cmdline_popup = {
          backend = "popup",
          relative = "editor",
          zindex = 200,
          position = {
            row = 10,
            col = "50%",
          },
          size = {
            width = 80,
            height = "auto",
          },
          -- win_options = {
          --   winhighlight = {
          --     Normal = "NoiceCmdlinePopup",
          --     FloatTitle = "NoiceCmdlinePopupTitle",
          --     FloatBorder = "NoiceCmdlinePopupBorder",
          --     IncSearch = "",
          --     CurSearch = "",
          --     Search = "",
          --   },
          --   winbar = "",
          --   foldenable = false,
          --   cursorline = false,
          -- },
        },
        cmdline_popupmenu = {
          -- relative = 'editor', -- "'cursor'"|"'editor'"|"'win'"
          position = {
            row = 13, -- "auto" doesn't work correctly
            col = "50%",
          },
          size = {
            width = 80, -- Making this as wide as the cmdline_popup
            height = "auto",
          },
          -- border = {
          --   ---@type _.NuiBorderStyle
          --   style = "rounded", -- 'double'"|"'none'"|"'rounded'"|"'shadow'"|"'single'"|"'solid'
          --   ---@type _.NuiBorderPadding
          --   padding = { 0, 1 },
          -- },
          -- win_options = {
          --   winhighlight = {
          --     Normal = "NoicePopupmenu", -- Normal | NoicePopupmenu
          --     FloatBorder = "NoicePopupmenuBorder", -- DiagnosticInfo | NoicePopupmenuBorder
          --     CursorLine = "NoicePopupmenuSelected",
          --     PmenuMatch = "NoicePopupmenuMatch",
          --   },
          -- },
        },
      },
    },
  },
}
