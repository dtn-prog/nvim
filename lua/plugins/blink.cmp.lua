return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            -- When `true`, the first item is automatically selected.
            -- When `false`, you must manually select an item (e.g., with arrow keys or Tab).
            preselect = false,

            -- When `true`, inserting a character that matches the selection accepts it.
            -- Set to `false` to prevent accidental acceptance.
            auto_insert = false,
          },
        },
      },
    },
  },
}
