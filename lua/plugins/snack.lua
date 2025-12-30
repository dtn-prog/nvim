return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        snacks_image = {
          relative = "editor",
          col = -1,
        },
      },
      image = { -- No extra brace here
        inline = false,
        float = true,
        enabled = true,
        formats = {
          "png",
          "jpg",
          "jpeg",
          "gif",
          "bmp",
          "webp",
          "tiff",
          "heic",
          "avif",
          "mp4",
          "mov",
          "avi",
          "mkv",
          "webm",
          "pdf",
          "icns",
        },
        force = true,
        doc = {
          enabled = true,
          inline = false,
          float = true,
          max_width = 80,
          max_height = 40,
          conceal = function(lang, type)
            return type == "math"
          end,
        },
        img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
        wo = {
          wrap = false,
          number = false,
          relativenumber = false,
          cursorcolumn = false,
          signcolumn = "no",
          foldcolumn = "0",
          list = false,
          spell = false,
          statuscolumn = "",
        },
        cache = vim.fn.stdpath("cache") .. "/snacks/image",
        debug = {
          request = false,
          convert = false,
          placement = false,
        },
        convert = {
          notify = false,
          mermaid = function()
            local theme = vim.o.background == "light" and "neutral" or "dark"
            return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
          end,
          magick = {
            default = { "{src}[0]", "-scale", "1920x1080>" },
            vector = { "-density", 192, "{src}[{page}]" },
            math = { "-density", 192, "{src}[{page}]", "-trim" },
            pdf = { "-density", 192, "{src}[{page}]", "-background", "white", "-alpha", "remove", "-trim" },
          },
        },
        math = {
          enabled = true,
          typst = {
            tpl = [[
              #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
              #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
              #set text(size: 12pt, fill: rgb("${color}"))
              ${header}
              ${content}]],
          },
          latex = {
            font_size = "Large",
            packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
            tpl = [[
              \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
              \usepackage{${packages}}
              \begin{document}
              ${header}
              { \${font_size} \selectfont
                \color[HTML]{${color}}
              ${content}}
              \end{document}]],
          },
        },
      },
    },

    -- THIS IS WHERE YOU PUT THE CONFIG BLOCK
    config = function(_, opts)
      require("snacks").setup(opts)

      -- Automatically show image hover when resting cursor on a link
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          if vim.bo.filetype == "markdown" then
            -- This checks if the cursor is actually on an image link
            require("snacks.image").hover()
          end
        end,
      })
    end,
  },
}
