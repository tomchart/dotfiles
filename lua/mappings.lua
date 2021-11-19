local g = vim.g
local api = vim.api
local cmd = vim.cmd

cmd('autocmd BufWritePost mappings.lua source <afile>')

g.mapleader = ' '

-- nicked this func from marcus
local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    for k, v in pairs(opts) do options[k] = v end
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end


-------------------------------------------------------
-- moving around, tabs, windows, and buffers
-------------------------------------------------------
-- in insert mode, jj exits this mode
map('i', 'jj', '<esc>')

-- <leader><cr> hides highlight
map('n', '<leader><cr>', ':noh<cr>')

-- some comfort binds
-- (thanks again marcus, these are tight as fuck)
map('n', 'gk', 'gg')
map('v', 'gk', 'gg')
map('n', 'gj', 'G')
map('v', 'gj', 'G')
map('n', 'gh', '^')
map('v', 'gh', '^')
map('n', 'gl', '$')
map('v', 'gl', 'g_')

-- move & manipulate windows
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-w>j', '<c-w>J')
map('n', '<c-w>k', '<c-w>K')
map('n', '<c-w>l', '<c-w>L')
map('n', '<c-w>h', '<c-w>H')
map('n', '<c-w><', '<c-w>5<')
map('n', '<c-w>>', '<c-w>5>')
map('n', '<c-w>-', '<c-w>5-')
map('n', '<c-w>=', '<c-w>5+')
map('n', '<c-w>e', '<c-w>=')

-- copy to end of line from current pos with Y
map('n', 'Y', 'y$')



-------------------------------------------------------
-- plugin mappings
-------------------------------------------------------
-- nvim-tree.lua
map('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')

