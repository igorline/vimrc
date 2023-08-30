return {
  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust " },
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
