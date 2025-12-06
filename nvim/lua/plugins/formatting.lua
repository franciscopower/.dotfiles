return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
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
        yaml = { 'prettier' },
        svelte = { 'prettier' },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--config-precedence",
            "prefer-file",
          }
        },
      },

    })
    vim.keymap.set("n", "<leader>nn", require('conform').format, { desc = "Format buffer" })
  end,
}
