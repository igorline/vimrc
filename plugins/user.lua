local variable = os.getenv("VARIABLE_NAME")

local plugins = {
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
  { "wuwe1/vim-huff",                lazy = false },
  { "EdenEast/nightfox.nvim" },
  { "Shatur/neovim-ayu" },
  { "simrat39/symbols-outline.nvim", lazy = false },
}

-- Conditionally add vim-huff plugin
if variable then
  table.insert(plugins, 1, {
  "zbirenbaum/copilot.lua",
  lazy = false,
  event = "VimEnter",
  config = function()
  vim.defer_fn(function()
      require("copilot").setup {
      panel = {
          enabled = true,
          auto_refresh = true,
          ---@type table<'accept'|'next'|'prev'|'dismiss', false|string>
          keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
          },
      },
      suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 50,
          keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
          },
      },
      }
  end, 100)
  end,
})
end

return plugins
