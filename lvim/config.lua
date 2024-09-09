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

  {"norcalli/nvim-colorizer.lua"},

  {"kat0h/bufpreview.vim",
  dependencies = { 'vim-denops/denops.vim' },
  build = 'deno task prepare',
  ft = 'markdown',
  cmd = { 'PreviewMarkdown', 'PreviewMarkdownStop', 'PreviewMarkdownToggle' },
  }

}

lvim.transparent_window = true

lvim.colorscheme = "retrobox"

