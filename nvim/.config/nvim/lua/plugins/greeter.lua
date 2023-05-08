local m = {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

m.init = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    [[ ___   __    ______   ______    __   __   ________  ___ __ __     ]],
    [[/__/\ /__/\ /_____/\ /_____/\  /_/\ /_/\ /_______/\/__//_//_/\    ]],
    [[\::\_\\  \ \\::::_\/_\:::_ \ \ \:\ \\ \ \\__.::._\/\::\| \| \ \   ]],
    [[ \:. `-\  \ \\:\/___/\\:\ \ \ \ \:\ \\ \ \  \::\ \  \:.      \ \  ]],
    [[  \:. _    \ \\::___\/_\:\ \ \ \ \:\_/.:\ \ _\::\ \__\:.\-/\  \ \ ]],
    [[   \. \`-\  \ \\:\____/\\:\_\ \ \ \ ..::/ //__\::\__/\\. \  \  \ \]],
    [[    \__\/ \__|/ \_____\/ \_____\/  \___/_/ \________\/ \__\/ \__\/]],
  }
  --   dashboard.section.header.val = {
  -- [[ _   _  _____  _____  _   _  _____ ___  ___]],
  -- [[| \ | ||  ___||  _  || | | ||_   _||  \/  |]],
  -- [[|  \| || |__  | | | || | | |  | |  | .  . |]],
  -- [[| . ` ||  __| | | | || | | |  | |  | |\/| |]],
  -- [[| |\  || |___ \ \_/ /\ \_/ / _| |_ | |  | |]],
  -- [[\_| \_/\____/  \___/  \___/  \___/ \_|  |_/]],
  -- }

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("SPC e", "פּ Open Explorer", ":NvimTreeToggle<cr>"),
    dashboard.button("f f", "  Find file", ":Telescope find_files hidden=true<CR>"),
    dashboard.button("f p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("f r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("f t", "  Find text", ":Telescope live_grep <CR>"),
    -- dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
    dashboard.button("u", "  Update plugins", "<cmd>TSUpdate<CR><cmd>MasonUpdate<CR><CMD>Lazy update<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    return {
      [[   Brodie Henry 2023   ]],
      [[infinitydigital.systems]],
    }
  end

  dashboard.section.footer.val = footer()
  for _, button in ipairs(dashboard.section.buttons.val) do
    -- button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "Function"
  end

  dashboard.section.footer.opts.hl = "Comment"
  dashboard.section.header.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Title"

  dashboard.opts.opts.noautocmd = true

  -- starts alpha
  alpha.setup(dashboard.opts)
end

return m
