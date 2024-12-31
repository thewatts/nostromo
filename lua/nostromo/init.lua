local M = {}

-- Export theme colors and config for other plugins to use
M.colors = require("nostromo.theme").colors
M.lualine = require("nostromo.theme").lualine

M.name = "nostromo"
M.version = "0.0.4"

function M.setup(opts)
  opts = opts or {}
  require("nostromo.theme").setup(opts)
end

return M
