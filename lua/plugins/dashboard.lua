return {
  "goolord/alpha-nvim",
  config = function()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")
    local logo = {
    [[███╗   ███╗██████╗]],
    [[████╗ ████║██╔══██╗]],
    [[██╔████╔██║██████╔╝]],
    [[██║╚██╔╝██║██╔══██╗]],
    [[██║ ╚═╝ ██║██████╔╝]],
    [[╚═╝     ╚═╝╚═════╝ ]],
  }

    -- Number of empty lines to add
    local numEmptyLines = 10

    -- Insert empty lines ("\n") at the beginning of the logo table
    for _ = 1, numEmptyLines do
      table.insert(logo, 1, " ")
    end

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {
      dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "📄  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("o", "📁  Recently opened projects", ":Telescope projects <CR>"),
      dashboard.button("r", "🕒  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "🗟  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "⚙️  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
      -- prnvbn in binary!
      return "01110000 01110010 01101110 01110110 01100010 01101110"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    dashboard.opts.opts.position = "center"
    alpha.setup(dashboard.opts)
  end,
}

