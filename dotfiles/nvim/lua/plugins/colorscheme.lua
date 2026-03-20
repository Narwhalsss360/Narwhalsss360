function colorschemeForTime()
    local hour = tonumber(os.date("%H"))

    if 10 <= hour and hour <= 17 then
      return "evening"
    elseif 18 <= hour and hour <= 22 then
      return "slate"
    else
      return "murphy"
    end
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorschemeForTime(),
    },
  }
}
