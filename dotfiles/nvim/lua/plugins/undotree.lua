return {
  "mbbill/undotree",
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  },
  config = function()
    vim.opt.undofile = true
  end
}
