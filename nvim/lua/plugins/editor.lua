return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("Kanagawa_Customizations", { clear = true }),
        callback = function()
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#54546d", bg = "#1f1f28" })
          vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#76946a", bg = "#1f1f28" })
          vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#dca561", bg = "#1f1f28" })
          vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#c34043", bg = "#1f1f28" })
          vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c8c093", bg = "#2a2a37" })
          -- Original colors
          -- StatusLine    xxx guifg=#c8c093 guibg=#16161d
        end,
        desc = "Customize Kanagawa highlight groups",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "progress", "location" },
      },
    },
  },
  {
    cond = vim.fn.has("win32") ~= 1,
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup({
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end,
  },
}
