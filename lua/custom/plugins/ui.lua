return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
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
}
