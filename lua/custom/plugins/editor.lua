return {
  'tpope/vim-sleuth',

  {
    'numToStr/Comment.nvim',

    keys = {
      'gcc',
      'gbc',
      { 'gc', mode = 'v' },
      { 'gb', mode = 'v' },
    },

    opts = {},
  },

  {
    -- More options: https://github.com/folke/trouble.nvim
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },

    keys = {
      { '<leader>xx', function() require('trouble').toggle() end,                        desc = 'Toggle Trouble' },
      { '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, desc = 'Toggle Trouble (Worksapce)' },
      { '<leader>xd', function() require('trouble').toggle('document_diagnostics') end,  desc = 'Toggle Trouble (Document)' },
      { '<leader>xq', function() require('trouble').toggle('quickfix') end,              desc = 'Toggle Trouble (Quickfix)' },
      { '<leader>xl', function() require('trouble').toggle('loclist') end,               desc = 'Toggle Trouble (Loclist)' },
      { '<leader>xr', function() require('trouble').refresh() end,                       desc = 'Refresh Trouble' },
    },

    opts = {
    },

  }
}
