def keymaps(config):
    # Bindings for normal mode
    # Scroll
    config.bind('j', 'scroll-px 0 100') # Increased scoll speed
    config.bind('k', 'scroll-px 0 -100') # Increased scoll speed
    # Zoom
    config.bind('<Ctrl-=>', 'zoom-in') # Zoom In
    config.bind('<Ctrl-->', 'zoom-out') # Zoom Out
    # Tab Navigation
    config.bind('<Alt-p>', 'tab-next') # Next Tab
    config.bind('<Alt-o>', 'tab-prev') # Previous Tab
    config.bind('<Ctrl-Tab>', 'tab-next') # Next Tab
    config.bind('<Ctrl-Shift-Tab>', 'tab-prev') # Previous Tab
    config.bind('<Alt-c>', 'tab-close') # Close tab
    # For synergy between qutebrowser and other browsers 
    config.bind('<Alt-d>', 'set-cmd-text -s :open') # open open prompt
    # Open hints in rapid mode
    config.bind("<Alt-f>", 'hint --rapid links tab-bg') # open hints in rapid mode
    # Open videos using umpv script
    config.bind('xv', "hint links spawn ~/.config/qutebrowser/userscripts/umpv.py {hint-url} --ytdl-format=best") # Open hint to open video in custom umpv script
    config.bind('xc', "spawn ~/.config/qutebrowser/userscripts/umpv.py {url} --ytdl-format=best") # Open hint to open video in custom umpv script
    config.bind('xV', "hint --rapid links spawn ~/.config/qutebrowser/userscripts/umpv.py {hint-url} --ytdl-format=best") # Open rapid hint to open video in custom umpv script
    # Open Current Pages in other browsers
    config.bind('xb', "spawn brave {url}") # Open current tab in Brave
    config.bind('xf', "spawn firefox {url}") # Open current tab in Firefox
    config.bind('<Space>xb', "spawn brave {url}") # Open current tab in Brave
    config.bind('<Space>xf', "spawn firefox {url}") # Open current tab in Firefox
    # Downloads
    config.bind('<Space>di', "hint images download") # Open hint to download images
    config.bind('<Space>dv', 'hint links spawn alacritty -class dialog -e yt-dlp {hint-url}') # Open hint to download video
    config.bind('<Space>dp', 'download') # Open hint to download page
    
    # Bindings for insert mode
    config.bind('<Alt-e>', 'edit-text', mode='insert') # Open Text editor with contents of your current text box

    # Bindings for hint mode
    config.bind('<Shift-F>', 'hint all tab-bg', mode='hint') # Switch hint mode to open in new tab
    config.bind('<Shift-r>', 'hint --rapid links tab-bg', mode='hint') # Switch hint mode to rapid mode
    config.bind('<Alt-r>', 'hint --rapid links tab-bg', mode='hint') # Switch hint mode to rapid mode

