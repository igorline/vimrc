return {
  settings = {
    ["rust-analyzer"] = {
      --cargo = {
      --  features = { "all" },
      --},
      rustfmt = {
        extraArgs = { "+nightly" },
      },
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--all", "--all-features", "--", "-D", "warnings" },
      },
    },
  },
}
