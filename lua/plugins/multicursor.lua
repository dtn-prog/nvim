return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end, { desc = "Add cursor above" })
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end, { desc = "Add cursor below" })
    set({ "n", "x" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Skip line above" })
    set({ "n", "x" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end, { desc = "Skip line below" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor to next match" })
    set({ "n", "x" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip next match" })
    set({ "n", "x" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor to previous match" })
    set({ "n", "x" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip previous match" })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor with mouse" })
    set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Drag to add cursors" })
    set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Release mouse cursor" })

    -- Disable and enable cursors.
    set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle multicursors" })

    -- Mappings only apply when multiple cursors are active.
    mc.addKeymapLayer(function(layerSet)
      layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Switch to previous cursor" })
      layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Switch to next cursor" })
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor, { desc = "Delete current cursor" })
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end, { desc = "Enable or clear cursors" })
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
