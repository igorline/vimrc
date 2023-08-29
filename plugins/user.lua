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
	-- Huff syntax highlighting
	{ "wuwe1/vim-huff",           lazy = false },
	-- Vimwiki
-- 	{ "vimwiki/vimwiki",           lazy = false, 
--    init = function () --replace 'config' with 'init'
--       -- vim.g.vimwiki_list = {{path = '~/Docs/Mywiki', syntax = 'markdown', ext = '.md'}}

-- vim.g.vimwiki_list = {{
--       path = '~/Documents/wiki',
--       syntax = 'markdown',
--       ext='.md'
--       },
--       {
--       path= '~/Documents/wiki/studies',
--       syntax= 'markdown',
--       ext= '.md'
--       }
--     }
--[=====[ 
syntax match atWord '@\w\+'
highlight link atWord Special

" Match @todo, will override previous match
syntax match myTodo '@\ctodo'
highlight link myTodo Todo

" Modify checkboxes and marks to stand out more
syntax region myCheckMark matchgroup=myCheckBox start='[-*]\s\[' end='\][^(]' skip='[ \.oOX]{1}' oneline
highlight link myCheckBox Delimiter
highlight link myCheckMark Special

" function! VimwikiLinkHandler(link)
  " try
    " call system('firefox-dev ' . shellescape(a:link).' &')
    " " let browser = 'firefox-dev'
    " " execute '!start "'.browser.'" ' . a:link
    " return 1
  " catch
    " echo "This can happen for a variety of reasons ..."
  " endtry
  " return 0
" endfunction

" No url shortening
let g:vimwiki_url_maxsave=4
" let g:vimwiki_map_prefix = 'e'
" let g:vimwiki_conceallevel = 2
"

" autocmd Filetype vimwiki set filetype=markdown.vimwiki

" hi link VimwikiHeaderChar htmlBold

" let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\='



 
nmap <Leader>tl <Plug>VimwikiToggleListItem 
vmap <Leader>tl <Plug>VimwikiToggleListItem
nmap <Leader>wh <Plug>VimwikiSplitLink
vmap <Leader>wh <Plug>VimwikiSplitLink
nmap <Leader>wv <Plug>VimwikiVSplitLink
vmap <Leader>wv <Plug>VimwikiVSplitLink

nmap <M-Space> <Plug>VimwikiToggleListItem
autocmd FileType vimwiki nmap <F10> i- [ ]

au! BufRead,BufNewFile *.md       set filetype=mkd syntax=markdown
au! BufRead,BufNewFile *.md.asc       set filetype=mkd syntax=markdown

autocmd BufNewFile ~/Documents/diary/[0-9]*.md :silent %!echo "\# `date -d '%:t:r' +'\%A, \%B \%d \%Y'`\n"
},--]=====]
--    end
-- },
{ "rafamadriz/friendly-snippets" },
{ "EdenEast/nightfox.nvim" },
{ "Shatur/neovim-ayu" },
{ "simrat39/symbols-outline.nvim", lazy = false },
{
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
    config = function(plugin, opts)
    require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
},
-- Rust tools
{ "simrat39/rust-tools.nvim", lazy = false, config = function(plugin, opts)
  require("symbols-outline").setup()
  end,},
{
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
    require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
  end,
  dependencies = { "rafamadriz/friendly-snippets" },
},
-- Leap
		{
			"ggandor/leap.nvim",
			lazy = false,
			config = function()
				local leap = require("leap")
				leap.setup({
					highlight_unlabeled_phase_one_targets = false,
				})
				leap.add_default_mappings()
			end,
		},
    {
      "nvim-neorg/neorg",
			lazy = false,
      build = ":Neorg sync-parsers",
      opts = {
          load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.export"] = {}, -- Adds export to markdown
              ["core.export.markdown"] = {}, -- Adds export to markdown
              ["core.dirman"] = { -- Manages Neorg workspaces
                  config = {
                      workspaces = {
                          notes = "~/Documents/wiki2",
                      },
                  },
              },
              ["core.integrations.telescope"] = {}, -- Adds export to markdown
          },
      },
      dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
      init = function()
         vim.keymap.set("n", "<Leader>ww", ":tabnew | Neorg workspace notes<CR>",
                { desc = "Open Neorg's notes workspace", silent = true })
         vim.keymap.set("n", "<Leader>w<Leader>w", ":Neorg journal today<CR>",
                { desc = "Open Neorg's notes journal today", silent = true })
      end,
    },
    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    },
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
  opts = {
    sign_priority = 5, -- sign priority
    keywords = {
      audit = {
        icon = " ", -- icon used for the sign, and in search results
        color = "warning", -- can be a hex color, or a named color (see below)
        -- alt = { "audit-ok", "audit-info" },
        -- signs = false, -- configure signs for some keywords individually
      },
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
      pattern = [[.*\@*<(KEYWORDS)(\s*|:)]], -- pattern used for highlightng (vim regex)
    },
    search =  {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[@*\b(KEYWORDS)(\s|:)]] -- ripgrep regex
    },
  }
},
{
        "EdenEast/nightfox.nvim",
        config = function()
          require("nightfox").setup {
            -- disable extra plugins that AstroNvim doesn't use (this is optional)
            modules = { 
              barbar = false,
              dashboard = false,
              fern = false,
              fidget = false,
              gitgutter = false,
              glyph_palette = false,
              illuminate = false,
              lightspeed = false,
              lsp_saga = false,
              lsp_trouble = false,
              modes = false,
              neogit = false,
              nvimtree = false,
              pounce = false,
              sneak = false,
              symbols_outline = false,
            },
            groups = {
              all = {
                -- add highlight group for AstroNvim's built in URL highlighting
                HighlightURL = { style = "underline" },
              },
            },
          }
        end,
      },
}
