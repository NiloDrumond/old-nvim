
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.lua",
  command = ":lua vim.lsp.buf.formatting_sync()"
})

vim.keymap.set('n', "<space><space>", "<cmd>:lua vim.lsp.buf.formatting_sync()<CR>", { silent = true })