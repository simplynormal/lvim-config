lvim.plugins = {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  {
    'HiPhish/nvim-ts-rainbow2',
    config = function()
      require('nvim-treesitter.configs').setup({
        rainbow = {
          enable = true,
          query = {
            'rainbow-parens',
            html = 'rainbow-tags',
            latex = 'rainbow-blocks',
            tsx = 'rainbow-parens',
          },
          strategy = require('ts-rainbow').strategy.global,
        },
      })
    end
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      require("tailwindcss-colors").setup()
      local nvim_lsp = require("lspconfig")

      local on_attach = function(_, bufnr)
        -- other stuff --
        require("tailwindcss-colors").buf_attach(bufnr)
      end

      nvim_lsp["tailwindcss"].setup({
        -- other settings --
        on_attach = on_attach,
      })

      lvim.builtin.cmp.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      local colorizer = require_clean("colorizer")
      colorizer.setup({ "*" }, {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = true,        -- "Name" codes like Blue or blue
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background", -- Set the display mode.
      })
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
      local colors = require("tokyonight.colors").setup()

      require("scrollbar").setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
          Reference = {
            text = { "-", "=" },
            color = colors.cyan,
            priority = 1,
          },
          GitChange = {
            text = "|",
            color = colors.warning
          },
          GitAdd = {
            text = "|",
            color = colors.hint
          },
          GitDelete = {
            text = "|",
            color = colors.error
          },
        }
      })

      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("scrollbar.handlers.search").setup({
        override_lens = function() end,
      })
    end,
  },
  { "m00qek/baleia.nvim" },
  {
    "samodostal/image.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    config = function()
      -- Require and call setup function somewhere in your init.lua
      require('image').setup {
        render = {
          min_padding = 5,
          show_label = true,
          show_image_dimensions = true,
          use_dither = true,
          foreground_color = true,
          background_color = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
  },
}

lvim.colorscheme = "tokyonight-moon"
