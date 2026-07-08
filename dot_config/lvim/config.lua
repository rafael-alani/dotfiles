-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.termguicolors = true

lvim.plugins = {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
        italics = false,
        disable_italic_comments = true,
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
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
      })
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      require("auto-dark-mode").setup({
        set_dark_mode = function()
          vim.opt.background = "dark"
          vim.cmd.colorscheme("gruvbox")
        end,
        set_light_mode = function()
          vim.opt.background = "light"
          vim.cmd.colorscheme("everforest")
        end,
        update_interval = 3000,
        fallback = "dark",
      })
    end,
  },
}

-- fallback theme before auto-dark-mode applies
vim.opt.background = "dark"
lvim.colorscheme = "gruvbox"
