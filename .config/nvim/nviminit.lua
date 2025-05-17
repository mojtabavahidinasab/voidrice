vim.lsp.enable('pyright')
vim.cmd("colorscheme gruvbox")

-- Default plugin options
local default_opts = {
  create_user_commands = true, -- Generate user commands to enable and disable bidi-mode
  default_base_direction = 'LR', -- Options: 'LR' and 'RL'
  intuitive_delete = true, -- Swap <DEL> and <BS> when using a keymap contra base direction
}

local bidi = require('bidi')
bidi.setup()

vim.o.statusline = [[%!luaeval('require("bidi").buf_get_bidi_mode(vim.api.nvim_win_get_buf(0), "<", ">")')]]

vim.keymap.set('n', '<leader>B', function() bidi.paste(nil) end, {})

-- Either
--require("bidi").setup()

-- Or (if you want to customize options)
--require("bidi").setup({
--  create_user_commands = false,
--})

-- You can specify a buffer to use OR pass in `nil`,
-- which will ask for a register.
--vim.keymap.set('n', '<leader>B', function() require('bidi').paste(nil), {})

-- For example (if ALL you want is the Bidi-Mode status)
--vim.o.statusline = [[%!luaeval('require("bidi").buf_get_bidi_mode(vim.api.nvim_win_get_buf(0))')]]
