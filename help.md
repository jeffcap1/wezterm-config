# Helpful Information

> [Website](https://wezfurlong.org/wezterm/)

## Commands

` wezterm show-keys --lua`
Prints out the current keybindings in Lua

## TermInfo

If an error is received about wezterm is unknown, then run the following command:

```shell
curl https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo | tic -x -
```
