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
  { "catppuccin/nvim",      name = "catppuccin" },
  { "nvim-lua/plenary.nvim" },

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
      require("user.plugins.null-ls")
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
      require("user.plugins.git.signs")
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = false,
    event = "BufRead",
    config = function()
      require("user.plugins.git.diffview")
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
      require("user.plugins.git.worktree")
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
              open(results)    -- argument is optional
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

  -- General
  { "AndrewRadev/switch.vim", lazy = false },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    branch = "jsx",
    config = true,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = true,
  },
  { "tpope/vim-repeat",            lazy = false },
  { "tpope/vim-speeddating",       lazy = false },
  { "dhruvasagar/vim-table-mode",  ft = { "markdown" } },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      "<C-Up>",
      "<C-Down>",
      "<S-Up>",
      "<S-Down>",
      "<S-Left>",
      "<S-Right>",
    },
    config = true,
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = true,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = true,
  },
  {
    "folke/twilight.nvim",
    config = true,
  },
  {
    "ggandor/lightspeed.nvim",
    keys = "s",
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = true,
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    version = "*",
    config = true,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = true,
    ft = { "markdown" },
  },
  -- {
  --   "Shatur/neovim-session-manager",
  --   lazy = false,
  --   config = true,
  -- },
  { "kylechui/nvim-surround", lazy = false, config = true },
  {
    "sunjon/shade.nvim",
    config = true,
  },
  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    ft = {
      "lua",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true,
  },
}
