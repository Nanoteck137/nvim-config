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
    'akinsho/toggleterm.nvim',

    keys = {
      { '<leader>gg', require('util').toggle_lazygit },
      { '<leader>ss', require('util').send_to_scratch },
      { '<leader>st', require('util').toggle_scratch, },
    },

    opts = {}
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = { "TodoTelescope", "TodoTrouble", "TodoLocList", "TodoQuickFix" },

    keys = {
      { '<leader>tt', '<cmd>TodoTrouble<CR>' },
      { '[t',         function() require("todo-comments").jump_next() end },
      { ']t',         function() require("todo-comments").jump_prev() end }
    },

    opts = {
      highlight = {
        before = "",          -- "fg" or "bg" or empty
        keyword = "bg",       -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg",         -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400,   -- ignore lines longer than this
        exclude = {},         -- list of file types to exclude highlighting
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
      },
    }
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
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",

    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },

    opts = {},
  },

  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = false;
      }
    },
  }
}
