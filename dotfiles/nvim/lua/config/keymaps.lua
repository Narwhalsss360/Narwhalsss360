-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Use mbbill's undotree since that's an actual tree
vim.keymap.set({ 'n', 'i', }, "<leader>su", vim.cmd.UndotreeToggle, {
  desc = "Undotree (real tree)"
})

-- Find help for visual selected
vim.keymap.set({ "v" }, "gh", function()
  local visual_selected = vim.fn.getregion(
    vim.fn.getpos("."),
    vim.fn.getpos("v"),
    { type = "v" }
  )[1]
  vim.cmd.help(visual_selected)
end, {
  desc = "Help of selection"
})
