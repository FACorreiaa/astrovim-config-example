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
  { "catppuccin/nvim", name = "catppuccin"},
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
	}
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
