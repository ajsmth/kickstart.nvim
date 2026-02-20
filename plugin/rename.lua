local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

vim.keymap.set('n', '<leader>rn', function()
  pickers
    .new({}, {
      prompt_title = 'Rename symbol',
      finder = finders.new_table { results = { '' } },
      sorter = conf.generic_sorter {},
      attach_mappings = function(_, map)
        map('i', '<CR>', function(bufnr)
          local name = action_state.get_current_line()
          actions.close(bufnr)
          if name ~= '' then
            vim.lsp.buf.rename(name)
          end
        end)
        return true
      end,
    })
    :find()
end)
