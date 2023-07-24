# WezTerm Config

Clone this project into your `$HOME/.config` directory for WezTerm terminal to pick up.


## Enable Global Keybinding (MacOS)

Symlink the `Show WezTerm.workflow` file to your `~/Library/Services` directory.
```bash
ln -s ~/Library/Services/"Show WezTerm.workflow"  ./"Show WezTerm.workflow"
```

Then in System Settings > Keyboard > Shortcuts > Services > General you should see Show WezTerm and you can assign a global key. Recommend making this the same as the one in the keybinding file (default is shift + ctrl + alt + command + space).


