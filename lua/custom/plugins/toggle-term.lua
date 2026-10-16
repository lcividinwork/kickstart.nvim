return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        direction = 'horizontal', -- can be 'float' | 'vertical' | 'tab'
      }

      -- Keymaps for terminal mode (THIS is the important part)
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }

        -- Exit terminal mode easily
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

        -- Navigate splits like normal Vim
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

        -- Optional: allow normal-mode scrolling inside terminal
        vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
      end

      -- Apply mappings whenever a terminal opens
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
  },
}
