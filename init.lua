vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.api.nvim_set_option("clipboard","unnamed")

local opts = { noremap = true, silent = true }

-- Wrapper function for setting keymaps with descriptions
local function keymap(mode, new, old, _opts, description)
  if description then
    if not _opts then
      _opts = {}
    end
    _opts.desc = description
  end
  vim.api.nvim_set_keymap(mode, new, old, _opts)
end
local builtin = require("telescope.builtin")
local wk = require("which-key")

wk.register({
  f = {
    name = "file",
    f = { builtin.find_files, "fuzzy find files" },
    g = { builtin.live_grep, "grep files" },
    r = { builtin.oldfiles, "recent files" },
  },
  g = {
    name = "telescope",
    d = { builtin.lsp_definitions, "go to definition" },
  },
  t = {
    name = "telescope",
    c = { builtin.colorscheme, "colorscheme" },
  },
}, { prefix = "<leader>" })

keymap("n", "<leader>w", "<cmd>w!<CR>", opts, "Save")
keymap("n", "<leader>k", "<cmd>bdelete<CR>", opts, "Kill Buffer")
keymap("n", "<leader>p", "<cmd>Lazy<CR>", opts, "Plugin Manager")
keymap("n", "<leader>q", "<cmd>wqall!<CR>", opts, "Quit")
keymap("n", "<leader>e", "<cmd>Ex<CR>", opts, "Open File Tree")
keymap("n", "<leader>s", "<C-W>w<CR>", opts, "Switch Window")

