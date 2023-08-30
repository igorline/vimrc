return {
  -- neorg
  {
    "nvim-neorg/neorg",
    lazy = false,
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},        -- Loads default behaviour
        ["core.concealer"] = {},       -- Adds pretty icons to your documents
        ["core.export"] = {},          -- Adds export to markdown
        ["core.export.markdown"] = {}, -- Adds export to markdown
        ["core.dirman"] = {            -- Manages Neorg workspaces
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
  }
}
