local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- themes
  "daschw/leaf.nvim",
  {
    "rose-pine/neovim",
    name = "rose-pine"
  },
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",

  -- improve vim
  "tpope/vim-surround",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  "windwp/nvim-ts-autotag",
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        mappings = {
          next = "ms",
          prev = "ma",
        }
      })
    end
  },
  "tpope/vim-fugitive",

  -- formatting
  {
    "prettier/vim-prettier",
    config = function()
      vim.keymap.set("n", "ü", "<cmd>Prettier<cr>")
    end
  },
  {
    "mcauley-penney/tidy.nvim",
    opts = {
      filetype_exclude = { "markdown", "diff" }
    },
  },

  -- UI
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          section_separators = { '', '' },
          component_separators = { '', '' },
        },
      })
    end
  },
  "romgrk/barbar.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    -- start screen
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end
  },
  {
    "j-morano/buffer_manager.nvim",
    config = function()
      vim.keymap.set("n", "<c-b>", "<cmd>lua require('buffer_manager.ui').toggle_quick_menu()<cr>")
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "gennaro-tedesco/nvim-peekup",
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    'gelguy/wilder.nvim',
    config = function()
      require("wilder").setup({modes = {":", "/", "?"}})
    end,
  },

  -- lsp and completion
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd [[TSUpdate]]
    end
  },
  "neovim/nvim-lspconfig",
  "VonHeikemen/lsp-zero.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        outline = {
          layout = "float"
        }
      })
    end,
  },

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  "github/copilot.vim",

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
}

require("lazy").setup(plugins)
