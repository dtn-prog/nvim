return {
  "vscode-neovim/vscode-multi-cursor.nvim",
  event = "VeryLazy",
  cond = function() return vim.g.vscode end,
  opts = {},
  config = function()
    local cursors = require("vscode-multi-cursor")
    local k = vim.keymap.set

    -- 1. THE "CTRL+D" POWER (Add next match)
    k({ "n", "x", "i" }, "<C-d>", function()
      cursors.addSelectionToNextFindMatch()
    end, { desc = "Add cursor to next match" })

    -- 2. THE "SKIP" POWER (VS Code native skip)
    k({ "n", "x" }, "<leader>s", function()
      vim.fn.VSCodeNotify("editor.action.moveSelectionToNextFindMatch")
    end, { desc = "Skip current match and move to next" })

    -- 3. VIM MOTION POWER
    -- Press 'mc' followed by any motion (w, e, j, f!) to add a cursor there
    k({ "n", "x" }, "mc", cursors.create_cursor, { expr = true, desc = "Create cursor with motion" })

    -- 4. CURSOR NAVIGATION (Jump between your active cursors)
    k({ "n" }, "[m", cursors.prev_cursor, { desc = "Jump to previous cursor" })
    k({ "n" }, "]m", cursors.next_cursor, { desc = "Jump to next cursor" })

    -- 5. THE ESCAPE HATCH (Clear everything)
    k({ "n" }, "<Esc>", function()
      cursors.cancel()
      vim.cmd("nohlsearch")
    end, { desc = "Clear cursors and highlights" })
  end,
}
