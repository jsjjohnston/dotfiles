return {
  'jmederosalvarado/roslyn.nvim',
  dependencies = {},
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('roslyn').setup {
      enable = false,
      auto_install = true,
      dotnet_cmd = 'dotnet', -- this is the default
      roslyn_version = '4.11.0-1.24226.4', -- this is the default
      on_attach = function(event)
        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })

        -- Find references for the word under your cursor.
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })

        -- Jump to the implementation of the word under your cursor.:w
        --
        --  Useful when your language has ways of declaring types without an actual implementation.
        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        -- vim.keymaps.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        -- vim.keymaps.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        -- vim.keymaps.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

        -- map('<leader>cf', require('csharp').fix_all, '[F]ix all')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        -- vim.keymaps.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client.server_capabilities.documentHighlightProvider then
        --   local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.document_highlight,
        --   })
        --
        --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.clear_references,
        --   })
        --
        --   vim.api.nvim_create_autocmd('LspDetach', {
        --     group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        --     callback = function(event2)
        --       vim.lsp.buf.clear_references()
        --       vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        --     end,
        --   })
        -- end

        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        --   if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        --     map('<leader>th', function()
        --       vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        --     end, '[T]oggle Inlay [H]ints')
      end,
      capabilities = capabilities,
    }
  end,
}
