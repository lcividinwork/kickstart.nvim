return {
  'b0o/SchemaStore.nvim',
  lazy = true,
  -- Optional: trigger loading when you open json or yaml files
  ft = { 'json', 'yaml', 'yml' },
  config = function()
    -- Safely require lspconfig to inject our schemastore settings
    local status_ok, lspconfig = pcall(require, 'lspconfig')
    if not status_ok then return end

    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,
}
