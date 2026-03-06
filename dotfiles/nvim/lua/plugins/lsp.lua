return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = { "W391" },
                  maxLineLength = 180,
                },
              },
            },
          },
        },
      },
    },
  },
}
