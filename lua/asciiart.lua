local M = {}

function M.LoadAscii()
  return vim.fn.readfile(vim.fn.stdpath('config') ..  '/lua/images/chessboard.txt')
end

return M
