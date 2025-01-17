-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "fsautocomplete"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.plugins = {
  {"ionide/Ionide-vim"},

  {"vim-denops/denops.vim"},

  {"nvim-tree/nvim-tree.lua"},

  {"karb94/neoscroll.nvim",
    mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    '<C-j>', '<C-k>',
    '<C-b>', '<C-f>',
    '<C-y>', '<C-e>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 1.0,   -- Global duration multiplier
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  ignored_events = {           -- Events ignored while scrolling
      'WinScrolled', 'CursorMoved'
  },
  },

  {"norcalli/nvim-colorizer.lua"},

  {"kat0h/bufpreview.vim",
  dependencies = { 'vim-denops/denops.vim' },
  build = 'deno task prepare',
  ft = 'markdown',
  cmd = { 'PreviewMarkdown', 'PreviewMarkdownStop', 'PreviewMarkdownToggle' },
  },

  {'brianhuster/live-preview.nvim'},
  {'brianhuster/autosave.nvim'}

--  {
--    'wfxr/minimap.vim',
--    build = "cargo install --locked code-minimap",
--    --cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
--    init = function()
--      vim.g.minimap_width = 10
--      vim.g.minimap_auto_start = true
--      vim.g.minimap_auto_start_win_enter = false
--      vim.g.minimap_highlight_range = true
--      vim.g.minimap_highlight_search = true
--    end,
--  }
}

lvim.transparent_window = true

lvim.colorscheme = "retrobox"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-j>"] = ":bd<CR>"
lvim.keys.normal_mode["<S-n>"] = ":NvimTreeToggle<CR>"

--require("nvim-tree").setup()
--local api = require('nvim-tree.api')
--
---- NvimTreeをトグルする関数
--local function nt_toggle_no_focus()
--  local tree = api.tree.is_visible()  -- NvimTreeが表示されているか確認
--  if tree then
--    api.tree.close()  -- NvimTreeが表示されていれば閉じる
--  else
--    api.tree.open()   -- NvimTreeが表示されていなければ開く
--  end
--end
--local opts = { noremap = true, silent = true }
--vim.keymap.set("n", "N", nt_toggle_no_focus, opts)

vim.opt.number = true
vim.opt.relativenumber = true
