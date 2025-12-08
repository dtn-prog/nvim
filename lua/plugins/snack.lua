return {
  "folke/snacks.nvim",
  opts = {
    image = {
      -- This is the master switch.
      -- When "true", opening 'image.png' converts the buffer into an image viewer.
      enabled = true,
      doc = {
        inline = true, -- Markdown support
        float = true, -- Floating window support
      },
    },

    -- Optional: Enable the Picker (Explorer) to preview images
    picker = {
      sources = {
        explorer = {
          -- This allows the picker to show image previews on the right
          previewers = {
            file = {
              ft = "image", -- Force image preview for image files
            },
          },
        },
      },
    },
  },
}
