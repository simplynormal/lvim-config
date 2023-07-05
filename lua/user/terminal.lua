lvim.builtin["terminal"].size = function(term)
  if term.direction == "horizontal" then
    return vim.o.lines * 0.3
  elseif term.direction == "vertical" then
    return vim.o.columns * 0.4
  end
end
lvim.builtin["terminal"].direction = "horizontal"
