vim.api.nvim_create_user_command("Dark", function()
  vim.opt.background = "dark"
end, {})

vim.api.nvim_create_user_command("Light", function()
  vim.opt.background = "light"
end, {})
