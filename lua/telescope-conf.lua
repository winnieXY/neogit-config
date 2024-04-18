local builtin = require('telescope.builtin')


local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

require('telescope').load_extension('themes')

telescope.setup {
  extensions = {
    ['ui-select'] = { require 'telescope.themes'.get_dropdown() }
  },
  vimgrep_argument = { 'rg', '--smart-case' },
  require 'telescope'.load_extension 'ui-select',
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  ft = {'mason'}
}
