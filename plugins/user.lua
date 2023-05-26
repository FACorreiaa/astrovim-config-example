return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  --themes
  { "catppuccin/nvim",       name = "catppuccin" },
  -- {'akinsho/git-conflict.nvim', version = "*", config = true},

  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require("plugins.git.worktree")
    end,
  },

  -- Navigating (Telescope/Tree/Refactor)
  { "nvim-pack/nvim-spectre" },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufNewFile",
    dependencies = { "mason.nvim" },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.null-ls")
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require("plugins.git.worktree")
    end,
  },

  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true
  },

  -- AI
  {
    "jcdickinson/codeium.nvim",
    event = "InsertEnter",
    cmd = "Codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = true
  },
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
    },
    config = true,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = false,
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    config = true
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require("plugins.git.worktree")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },

  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
      },
      {
        "David-Kunz/cmp-npm",
        config = true,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = true,
      },
    },

    -- LSP Addons
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      dependencies = "MunifTanjim/nui.nvim",
      config = true,
    },
    { "onsails/lspkind-nvim" },
    {
      "folke/trouble.nvim",
      cmd = { "TroubleToggle", "Trouble" },
      config = true,
    },
    { "nvim-lua/popup.nvim" },
    {
      "SmiteshP/nvim-navic",
      config = true,
      dependencies = "neovim/nvim-lspconfig",
    },
    { "jose-elias-alvarez/typescript.nvim" },
    {
      "axelvc/template-string.nvim",
      event = "InsertEnter",
      ft = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
      config = true, -- run require("template-string").setup()
    },
    {
      "lvimuser/lsp-inlayhints.nvim",
      branch = "main", -- or "anticonceal"
      config = true,
    },
    {
      "barrett-ruth/import-cost.nvim",
      build = "sh install.sh yarn",
      ft = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
      config = true,
    },
    {
      "dmmulroy/tsc.nvim",
      cmd = { "TSC" },
      config = true,
    },
    {
      "dnlhc/glance.nvim",
      config = true,
      opts = {
        hooks = {
          before_open = function(results, open, jump, method)
            if #results == 1 then
              jump(results[1]) -- argument is optional
            else
              open(results) -- argument is optional
            end
          end,
        },
      },
      cmd = { "Glance" },
      keys = {
        { "gd", "<cmd>Glance definitions<CR>",      desc = "LSP Definition" },
        { "gr", "<cmd>Glance references<CR>",       desc = "LSP References" },
        { "gm", "<cmd>Glance implementations<CR>",  desc = "LSP Implementations" },
        { "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
      },
    },

  },
}
--   require("catppuccin").setup({
--     flavour = "latte", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = true,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = true,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
