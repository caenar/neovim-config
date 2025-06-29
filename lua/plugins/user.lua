-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- Themes
  { "cocopon/iceberg.vim" },
  { "nanotech/jellybeans.vim" },
  { "haishanh/night-owl.vim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "navarasu/onedark.nvim" },
  { "dgox16/oldworld.nvim", lazy = false },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false },
  { "forest-nvim/sequoia.nvim", lazy = false },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  { "Everblush/nvim", name = "everblush" },
  { "NTBBloodbath/doom-one.nvim" },

  { "wakatime/vim-wakatime", lazy = false },
  { "karb94/neoscroll.nvim", opts = {} },
  {
    "sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup {
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        distance_stop_animating = 0.5,
      }
    end,
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode = true,
    },
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup {
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- Show the timer

        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!node_modules/",
          "--glob=!dist/",
          "--glob=!venv/",
          "--glob=!.git/",
        },
      })
    end,
  },

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣆⣾⣿⠇⣠⣾⣷⢂⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢞⡤⣠⣦⣾⣿⣾⣿⣷⣾⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⣴⠖⠒⠋⠉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⢶⣶⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⣀⠀⠀⠀⢀⣀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⣈⣭⣿⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⡟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣠⣾⣿⣶⣿⣿⣷⣶⣴⣿⣿⣿⣿⣖⡀ ",
        "⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣌⣿⣿⣿⣿⣿⡿⠿⢻⣿⣿⣿⣿⣿⣟⠛⠀ ",
        "⠀⠀⠀⠈⠹⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⠇⠀⠀⠀⠀⠀⠀⣀⠀⢀⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠙⠉⠛⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⢻⣿⣿⣿⡛⠿⠿⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⣀⡄⢠⣿⣿⣴⣿⣿⣷⣾⣿⡿⠆⠀⠀⠀⠀⠀⠀⠰⣾⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⠘⢿⣿⣿⣭⢛⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡉⠃⠀⠀⢰⣿⣷⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣶⣦⣄⡀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
        "⠀⠀⠀⠀⠀⠀⠀⠁⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣯⠉⠟⠁⠀⣴⣧⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣯⣿⣿⣿⣿⣏⠃⠀⠀⠀⠀⠀⣦⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠋⠿⠀⠀⣠⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⢠⣾⣶⣤⡀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡟⠇⢀⡀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣤⡄⣰⣧⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠙⣿⣿⣇⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠐⠞⠛⠛⠻⢷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⢀⣤⡄⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀     ",
        "⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠚⣿⣿⣤⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠀⠀    ",
        "⠀⠀⠀⠀⠀⠀⠀⠙⠺⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⠏⠙⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⢻⣷⣶⣤⠀⠀⠀⠀    ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠁⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠋⠉⠀⠀⠀⢸⣿⡏⠙⠇⠀⠀⠀⠀⠀  ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠟⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀ ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
      }
      return opts
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },
}
