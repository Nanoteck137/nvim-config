local M = {}

M.find_git_root = function()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    return nil
  end

  return git_root
end

M.toggle_lazygit = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    id = 100,
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    close_on_exit = true,
    on_open = function ()
      vim.cmd("startinsert!")
    end
  })

  lazygit:toggle()
end

M.send_to_scratch = function()
  local toggleterm = require("toggleterm")
  toggleterm.send_lines_to_terminal("single_line", true, { args = 101 })
end

M.toggle_scratch = function()
  local toggleterm = require("toggleterm")
  toggleterm.toggle(101)
end

return M
