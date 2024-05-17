local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    -- These three settings are optional, but recommended.
    prompt_prefix = "",
    entry_prefix = " ",
    selection_caret = " ",

    -- This is the important part: without this, Telescope windows will look a
    -- bit odd due to how borders are highlighted.
    --layout_strategy = 'grey',
    layout_config = {
      -- The extension supports both "top" and "bottom" for the prompt.
      prompt_position = "top",

      -- You can adjust these settings to your liking.
      width = 0.7,
      height = 0.5,
      preview_width = 0.6,
    },
  },

  mappings = {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      ["<esc>"] = actions.close,
      ["<CR>"] = actions.select_default + actions.center,
    },
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    },
  },
}
