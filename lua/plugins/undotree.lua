return {
  "mbbill/undotree",
  lazy = false,
  config = function()
    -- Optional: persistent undo setup if you want undo history to survive restarts
    -- LazyVim usually enables 'undofile' by default in options, but this ensures it.
    vim.opt.undofile = true
  end,
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },
  },
}
