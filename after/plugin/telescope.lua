vim.keymap.set('n', '<leader>ff', ":silent lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', ":lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>fb', ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', ":lua require'telescope.builtin'.help_tags(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fd', ":lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr>", { noremap = true, silent = true })

local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
      },
    },
  },
})

-- navigate extensions
require("telescope").load_extension("navi")
vim.keymap.set('n', '<c-f>', ":lua require('telescope').extensions.navi.select_session()<cr>", {})
