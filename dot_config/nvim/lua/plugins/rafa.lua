---@type LazySpec
return {
  -- ============================================================
  -- Core Neovim options + mappings
  -- ============================================================

   {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          termguicolors = true,
          number = true,
          relativenumber = true,
          background = "dark",
        },
      },
    },
  },
  -- ============================================================
  -- Default/fallback theme
  -- ============================================================

  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- ============================================================
  -- Everforest
  -- ============================================================

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup {
        background = "hard",
        transparent_background_level = 0,
        italics = false,
        disable_italic_comments = true,
      }
    end,
  },

  -- ============================================================
  -- Gruvbox
  -- ============================================================

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup {
        contrast = "hard",
        terminal_colors = true,
        transparent_mode = false,

        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
      }
    end,
  },

  -- ============================================================
  -- Follow macOS light/dark mode
  -- ============================================================

  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme "gruvbox"
      end,

      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme "everforest"
      end,

      update_interval = 3000,
      fallback = "dark",
    },
  },

  -- ============================================================
  -- Git diff / review
  -- ============================================================

  {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewDiffFiles",
      "DiffviewMergeFiles",
      "DiffviewDiffDirs",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  },
}

