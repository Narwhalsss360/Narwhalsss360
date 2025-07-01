-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


local a = 0;

local function splitpath(path)
    -- Returns the Path, Filename, and Extension as 3 values
    return string.match(path, "^(.-)([^\\/]-)(%.[^\\/%.]-)%.?$")
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local indent2 = {
  [".yaml"] = true,
  [".yml"] = true
}

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(event)
    if event["file"] == nil then
      print("isnil")
      return
    end

    path, filename, extension = splitpath(event["file"])
    if indent2[extension] then
      print(extension .. ": indent=2")
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
    else
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 4
    end
  end,
})
