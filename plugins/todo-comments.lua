return {
  -- todo-comments
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
      search = {
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
  }
}
