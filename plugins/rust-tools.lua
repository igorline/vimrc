return {
  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
