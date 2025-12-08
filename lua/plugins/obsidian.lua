return {
  -- =========================================
  -- 1. OBSIDIAN CONFIGURATION
  -- =========================================
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",

    -- Load plugin immediately if these commands are typed
    cmd = {
      "ObsidianSearch",
      "ObsidianQuickSwitch",
      "ObsidianNew",
      "ObsidianToday",
      "ObsidianTags",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Install fzf-lua so Obsidian can use it
      { "ibhagwan/fzf-lua", opts = {} },
    },

    opts = {
      workspaces = {
        { name = "personal", path = "~/vaults/personal" },
        { name = "work", path = "~/vaults/work" },
      },

      ui = { enable = false },

      completion = {
        nvim_cmp = true, -- This must be true even when using Blink
        min_chars = 2,
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.cursor_on_markdown_link() and "<cmd>ObsidianFollowLink<CR>" or "gf"
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      picker = {
        name = "fzf-lua",
        note_mappings = { new = "<C-x>", insert_link = "<C-l>" },
        tag_mappings = { tag_note = "<C-x>", insert_tag = "<C-l>" },
      },
    },
  },

  -- =========================================
  -- 2. BLINK CONFIGURATION (The Bridge)
  -- =========================================
  {
    "saghen/blink.cmp",
    -- Make sure blink.compat is loaded
    dependencies = {
      "saghen/blink.compat",
      opts = {},
    },
    opts = function(_, opts)
      -- 1. Define the Obsidian sources for Blink
      opts.sources.providers = opts.sources.providers or {}

      opts.sources.providers.obsidian = {
        name = "obsidian",
        module = "blink.compat.source",
        score_offset = 3, -- Boost obsidian suggestions in markdown
      }
      opts.sources.providers.obsidian_new = {
        name = "obsidian_new",
        module = "blink.compat.source",
      }
      opts.sources.providers.obsidian_tags = {
        name = "obsidian_tags",
        module = "blink.compat.source",
      }

      -- 2. Enable these sources globally (or specifically for markdown)
      opts.sources.default = opts.sources.default or {}
      vim.list_extend(opts.sources.default, { "obsidian", "obsidian_new", "obsidian_tags" })
    end,
  },
}
