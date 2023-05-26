return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  --test
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

	-- LSP Cmp
  -- todo
  -- tabnine

	-- LSP Addons
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("plugins.dressing")
		end,
	},
	{ "onsails/lspkind-nvim" },
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("plugins.trouble")
		end,
	},
	{ "nvim-lua/popup.nvim" },
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("plugins.navic")
		end,
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
		config = function()
			require("plugins.inlay-hints")
		end,
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
			{ "gd", "<cmd>Glance definitions<CR>", desc = "LSP Definition" },
			{ "gr", "<cmd>Glance references<CR>", desc = "LSP References" },
			{ "gm", "<cmd>Glance implementations<CR>", desc = "LSP Implementations" },
			{ "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
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
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		branch = "jsx",
		config = function()
			require("plugins.comment")
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{
		"akinsho/nvim-toggleterm.lua",
		lazy = false,
		branch = "main",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{ "tpope/vim-repeat", lazy = false },
	{ "tpope/vim-speeddating", lazy = false },
	{ "dhruvasagar/vim-table-mode", ft = { "markdown" } },
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
		config = function()
			vim.g.VM_leader = ";"
		end,
	},
	{
		"nacro90/numb.nvim",
		lazy = false,
		config = function()
			require("plugins.numb")
		end,
	},
	{
		"folke/todo-comments.nvim",
		lazy = false,
		event = "BufEnter",
		config = function()
			require("plugins.todo-comments")
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
	},
	{
		"folke/twilight.nvim",
		config = true,

	},
	{
		"ggandor/lightspeed.nvim",
		keys = "s",
		config = function()
			require("plugins.lightspeed")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.which-key")
		end,
	},
	{
		"ecosse3/galaxyline.nvim",
		config = function()
			require("plugins.galaxyline")
		end,
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.bufremove",
		version = "*",
		config = function()
			require("mini.bufremove").setup({
				silent = true,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.bufremove",
		},
		version = "*",
		config = function()
			require("plugins.bufferline")
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
		init = function()
			local banned_messages = {
				"No information available",
				"LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
				"LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
			}
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return require("notify")(msg, ...)
			end
		end,
	},
	{
		"vuki656/package-info.nvim",
		event = "BufEnter package.json",
		config = function()
			require("plugins.package-info")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"Shatur/neovim-session-manager",
		lazy = false,
		config = function()
			require("plugins.session-manager")
		end,
	},
	{ "kylechui/nvim-surround", lazy = false, config = true },
	{
		"sunjon/shade.nvim",
		config = function()
			require("shade").setup()
			require("shade").toggle()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		end,
	},
	{
		"echasnovski/mini.align",
		lazy = false,
		version = false,
		config = function()
			require("mini.align").setup()
		end,
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
		config = function()
			require("plugins.printer")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("plugins.indent")
		end,
	},
	{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = { "w", "e", "b", "ge" },
		config = function()
			vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
			vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
			vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
			vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
			vim.keymap.set(
				{ "n", "o", "x" },
				"ge",
				"<cmd>lua require('spider').motion('ge')<CR>",
				{ desc = "Spider-ge" }
			)
		end,
	},

	-- Snippets & Language & Syntax
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.colorizer")
		end,
	},

	-- AI
	-- {
	-- 	"jcdickinson/codeium.nvim",
	-- 	cond = EcoVim.plugins.ai.codeium.enabled,
	-- 	event = "InsertEnter",
	-- 	cmd = "Codeium",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = true,
	-- },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cond = EcoVim.plugins.ai.copilot.enabled,
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("plugins.copilot")
	-- 	end,
	-- },
	-- {
	-- 	"Bryley/neoai.nvim",
	-- 	cond = EcoVim.plugins.ai.chatgpt.enabled,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	cmd = {
	-- 		"NeoAI",
	-- 		"NeoAIOpen",
	-- 		"NeoAIClose",
	-- 		"NeoAIToggle",
	-- 		"NeoAIContext",
	-- 		"NeoAIContextOpen",
	-- 		"NeoAIContextClose",
	-- 		"NeoAIInject",
	-- 		"NeoAIInjectCode",
	-- 		"NeoAIInjectContext",
	-- 		"NeoAIInjectContextCode",
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>as", desc = "summarize text" },
	-- 		{ "<leader>ag", desc = "generate git message" },
	-- 	},
	-- 	config = true,
	-- },

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
		config = function()
			require("plugins.git.conflict")
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

	-- Testing
	{
		"rcarriga/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("plugins.neotest")
		end,
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = {
			"Coverage",
			"CoverageSummary",
			"CoverageLoad",
			"CoverageShow",
			"CoverageHide",
			"CoverageToggle",
			"CoverageClear",
		},
		config = function()
			require("coverage").setup()
		end,
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.dap")
		end,
		keys = {
			"<Leader>da",
			"<Leader>db",
			"<Leader>dc",
			"<Leader>dd",
			"<Leader>dh",
			"<Leader>di",
			"<Leader>do",
			"<Leader>dO",
			"<Leader>dt",
		},
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
		},
	},
	{
		"LiadOz/nvim-dap-repl-highlights",
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		build = {
			":TSInstall dap_repl",
			":TSUpdate dap_repl",
		},
	},

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "catppuccin"

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  --
  -- Configure require("lazy").setup() options
  lazy = {
    { "catppuccin/nvim", name = "catppuccin" },
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- colorscheme = "catppuccin-macchiato",
   -- colorscheme = "catppuccin-mocha",
  --colorscheme = "catppuccin-frappe",
   colorscheme = "catppuccin-latte",

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
