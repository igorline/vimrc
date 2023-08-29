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

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- {
   --  			cmd = { 'circom-lsp' },
   --  			filetypes = { 'circom' },
   --  			root_dir = function()
   --      			return lsp.dir.find_first({ 'package.json' }) or vim.api.nvim_buf_get_name(0)
   --  			end,
			-- }
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"solidity",
					-- "rust"
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the LSP setup handler function based on server name
		setup_handlers = {
			-- first function changes the default setup handler
			-- function(server, opts)
			--   require("lspconfig")[server].setup(opts)
			-- end,
			-- -- keys for a specific server name will be used for that LSP
			-- sumneko_lua = function(server, opts)
			--   -- custom sumneko_lua setup handler
			--   require("lspconfig")["sumneko_lua"].setup(opts)
			-- end,
			rust_analyzer = function(_, opts)
				require("rust-tools").setup({ server = opts })
			end,
		},
		-- Add overrides for LSP server settings, the keys are the name of the server
		config = {
			-- example for addings schemas to yamlls
			yamlls = {
				-- override table for require("lspconfig").yamlls.setup({...})
				settings = {
					yaml = {
						schemas = {
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						},
					},
				},
			},
			-- Add custom Nomic solidity LSP
			-- nomic_solidity = {
			-- 	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
			-- 	root_dir = require("lspconfig.util").root_pattern("foundry.toml"),
			-- 	filetypes = { "solidity" },
			-- 	single_file_support = true,
			-- },
			-- circom = {
   --  name = 'circom-lsp',
   --  cmd = { 'circom-lsp' },
   --  filetypes = { 'circom' },
   --  root_dir = function()
   --      return lsp.dir.find_first({ 'package.json' }) or vim.api.nvim_buf_get_name(0)
   --  end,
			-- },
			-- Rust Analyzer
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							-- features = { "all" },
						},
            checkOnSave = {
                command = "clippy"
            },
            rustfmt = {
                extraArgs = { "+nightly" }
            },
					},
				},
			},
		},
  },
  -- autocmd BufNewFile ~/.vimwiki/diary/[0-9]*.md :silent %!echo "\# `date -d '%:t:r' +'\%A, \%B \%d \%Y'`\n"
  vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*/diary/[0-9]*.md',
    group = mygroup,
    -- command = ':silent %!echo "\# `date -d '%:t:r' +'\%A, \%B \%d \%Y'`\n"',
    command = ':silent %!echo "\\# `date -d \'%:t:r\' +\'\\%A, \\%B \\%d \\%Y\'`\\n \\n\\#\\# Tasks to do\\n\\n\\#\\# Tomorrow"',
  }),
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
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
