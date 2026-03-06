-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local function is_wsl()
  local wsl_check = os.getenv("WSL_DISTRO_NAME") ~= nil
  return wsl_check
end

vim.opt.list = true
vim.opt.number = true
vim.opt.statuscolumn = "%{v:lnum}%s%{v:relnum}"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = ""
vim.g.autoformat = false
vim.cmd(
  "set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
)

function applyshell()
  if vim.fn.has("linux") == 1 then
    if vim.fn.executable("fish") == 1 then
      vim.o.shell = "fish"
    end
  elseif vim.fn.has("win32") == 1 then
    if vim.fn.executable("pwsh") == 1 then
      vim.o.shell = "pwsh"
    elseif vim.fn.executable("powershell") then
      vim.o.shell = "powershell"
    else
      return
    end

    vim.o.shellcmdflag =
      "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
  end
end

applyshell()
