# WezTerm Config

Clone this project into your `$HOME/.config` directory for WezTerm terminal to pick up.


## Enable Global Keybinding (MacOS)

1. Open Automator and choose new Quick Action
1. From the left bar choose `Run AppleScript`
1. Paste in the code from the `optional-config/global-show-wezterm.applescript` file into the action
1. File > Save and provide a meaningful name as this will show up in the system for you to use
1. Go to System Settings > Keyboard > Shortcuts > Services > General you should now see Show WezTerm
1. You can assign this to any global key.
    1. Recommend making this the same as the one in the keybinding file (default is shift + ctrl + alt + command + space).

![ShowWezTerm-AutomatorScript](https://github.com/jeffcap1/wezterm-config/assets/7104326/8d86caaa-9a2c-42f8-84ed-3e8e2a4e8119)
> Automator setup

![SetWezTerm-KeyboardShortcut](https://github.com/jeffcap1/wezterm-config/assets/7104326/00d743eb-1926-4945-86b6-91ec3958877f)
> System Settings > Keyboard > Keyboard Shortcuts
