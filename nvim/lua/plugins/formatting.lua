return {
  'stevearc/conform.nvim',
  opts = {},
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    python = { 'black', 'isort' },
    xml = { 'xmlformatter' },
    go = { 'gofumpt', 'goimports', 'golines' },
    html = { 'prettier' },
    css = { 'prettier' },
    htmlangular = { 'prettier' },
    json = { 'prettier' },
  },
  config = function()
    vim.keymap.set("n", "<leader>nn", vim.lsp.buf.format, { desc = "Format buffer" })
  end,
}
