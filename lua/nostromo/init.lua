local M = {}

M.name = "nostromo"
M.version = "0.0.1"

function M.init()
end

function M.setup(opts)
  opts = opts or {}
  require("nostromo.theme").setup(opts)
end

return M
