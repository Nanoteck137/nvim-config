local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      { 'j-hui/fidget.nvim', opts = {} },

      'folke/neodev.nvim',
      -- 'jose-elias-alvarez/null-ls.nvim'
    },

    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()

      local servers = {
        -- clangd = {},
        gopls = {},
        -- pyright = {},
        rust_analyzer = {
          ["rust-analyzer"] = {
            checkOnSave = {
              allTargets = false,
            },
          },
        },
        tsserver = {},
        html = {
          filetypes = { 'html', 'twig', 'hbs', 'htmldjango' },
          init_options = {
            provideFormatter = false
          }
        },
        htmx = {
          filetypes = { 'html', 'htmldjango' },
        },
        svelte = {},
        astro = {},
        tailwindcss = {
          filetypes = {
            'templ'
          },
          init_options = {
            userLanguages = {
              templ = "html"
            }
          }
        },

        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },

        templ = {}
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {}

      for k, v in pairs(servers) do
        require('lspconfig')[k].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = v,
          filetypes = (v or {}).filetypes,
          init_options = (v or {}).init_options,
        }
      end

      -- local null_ls = require("null-ls")
      -- null_ls.setup({
      --   sources = {
      --     null_ls.builtins.formatting.prettier
      --   },
      -- })
    end
  },
}
