return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,

    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      }
    },

    config = function(_, opts)
      require("tokyonight").setup(opts)

      -- TODO: Change to tokyonight
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {},
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  {
    'folke/which-key.nvim',
    opts = {},
    config = function(_, opts)
      require('which-key').setup(opts);

      -- TODO(patrik): This need to change later
      require('which-key').register {
        -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
        -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     lsp = {
  --       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --     },
  --     -- you can enable a preset for easier configuration
  --     presets = {
  --       bottom_search = true,     -- use a classic bottom cmdline for search
  --       command_palette = true,   -- position the cmdline and popupmenu together
  --       long_message_to_split = true, -- long messages will be sent to a split
  --       inc_rename = false,       -- enables an input dialog for inc-rename.nvim
  --       lsp_doc_border = false,   -- add a border to hover docs and signature help
  --     },
  --   },
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },

  {
    'stevearc/dressing.nvim',
    opts = {},
  }
}
