local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end
treesitter.setup(astronvim.user_plugin_opts("plugins.treesitter", {
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}))
