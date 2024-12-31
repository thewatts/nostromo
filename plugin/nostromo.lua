if vim.fn.has("nvim-0.8.0") == 0 then
  vim.api.nvim_err_writeln("Nostromo requires at least Neovim 0.8.0")
  return
end

vim.api.nvim_create_user_command("Nostromo", function()
  require("nostromo").setup()
end, {})
