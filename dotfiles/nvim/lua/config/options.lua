-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%l|%r"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.autoformat = false
vim.g.catppuccin_flavour = "mocha"
vim.g.laztvim_picker = "telescope"
vim.g.zig_fmt_autosave = false


if vim.fn.has("linux") then
    if vim.fn.executable("fish") then
        vim.o.shell = "fish"
    end
elseif vim.fn.has("win32") then
    if vim.fn.executable("pwsh") == 1 then
        vim.o.shell = "pwsh"
    else
        vim.o.shell = "powershell"
    end

    vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

