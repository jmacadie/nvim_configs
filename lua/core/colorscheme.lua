-- set colorscheme to nightfox (nordfox variant) with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme nordfox")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
