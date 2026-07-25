# theme

Switches my whole setup between two color themes in one command: **sora** and **gruvbox-material**.

```bash
theme            # toggle to the other theme
theme gruvbox    # force gruvbox-material
theme sora       # force sora
```

The current theme is read from the sketchybar palette selector, so a bare `theme` always flips to the other one.

## What it touches

| Tool | File | How it applies |
|------|------|----------------|
| sketchybar | `sketchybar/colors.lua` | flips `local theme`, then `sketchybar --reload` |
| tmux | `tmux/tmux.conf` | swaps the plugin theme and copy-mode `mode-style`, then `tmux source-file` |
| nvim | `nvim/lua/plugins/colorscheme.lua` | rewrites the LazyVim colorscheme, and live-switches every running nvim through its socket |
| hlchunk | `nvim/lua/plugins/hlchunk.lua` | comments/uncomments the color pair (chunk + line numbers) |
| bat | `bat/config` | swaps the `--theme` value (next `bat` call uses it) |
| btop | `btop/btop.conf` | swaps the `color_theme` path, applies on next launch |
| yazi | `yazi/theme.toml` | copies the palette variant from `yazi/themes/` over it, next launch |
| hunk | `hunk/config.toml` | copies the palette variant from `hunk/` over it |
| lazygit | `lazygit/config.yml` | copies the palette variant from `lazygit/` over it, next launch |
| obsidian | `anton_lab/.obsidian/appearance.json` | swaps `cssTheme`, applies on Obsidian restart |
| opencode | `opencode/tui.json` | swaps the `theme` value, applies on next launch |
| git-delta | `~/.gitconfig` | swaps the included palette gitconfig, next `git diff` uses it |
| borders | `borders/bordersrc` | rewrites `active_color`, then pushes it to the running daemon |
| wallpaper | `wallpapers/current-theme.jpg` | overwrites this fixed file with the theme image, then restarts WallpaperAgent |
| ghostty | `ghostty/config` | swaps the theme, then reloads the front window |

sketchybar, tmux, nvim, borders and ghostty update live (ghostty needs the Accessibility permission described below). bat, hunk and git-delta are CLIs, so their next invocation picks up the change. hlchunk, btop, yazi, lazygit and opencode apply on their next launch. Obsidian applies its theme (`Sora` or `Material Gruvbox`) on restart.

yazi, hunk and lazygit switch by copying a whole theme-file snapshot (`<palette>.toml` / `<palette>.yml`) over the live config, so edits to non-color settings in those live files get overwritten on switch. Keep such edits in the per-palette snapshots instead.

## Per-theme values

- **gruvbox-material**: ghostty theme `gruvbox-material` (background `#171717`), sketchybar background `#171717`, border `#D4BE98`, tmux copy-mode `bg=#d4be98`, hlchunk `#F9B34C`, wallpaper `stellar_gruvbox.png`.
- **sora**: ghostty theme `sora` (background `#0e1018`), border `#80C8E0`, tmux copy-mode `bg=#1e2430`, hlchunk `#80C8E0`, wallpaper `stellar_sora.png`.

bat, btop, yazi, hunk, lazygit, opencode and git-delta each use their matching palette named `gruvbox-material` or `sora`. The `gruvbox-material` variants were generated from the sora artifacts by remapping the palette to the nvim gruvbox-material colors, so they match the rest of the setup. git-delta's `syntax-theme` points at the bat `gruvbox-material` theme.

gh-dash is not wired: it has no color config and follows the terminal's ANSI colors, so it already tracks ghostty.

Each ghostty theme file under `ghostty/themes/` embeds its own background, so the script only swaps the `theme` line and the config has no `background` line of its own. The custom `gruvbox-material` theme matches the nvim palette.

## Notes

- **ghostty** has no reload command, so the script presses its reload keybind (`super+shift+,`) with osascript. That needs Accessibility permission for Ghostty (System Settings > Privacy and Security > Accessibility). Without it the script prints a reminder and you press `cmd+shift+,` yourself.
- **hlchunk** picks its color at setup time and has no live recolor, so its change shows after the next nvim launch. The rest of nvim recolors right away.
- **wallpaper** works by swapping the bytes of one fixed file, `wallpapers/current-theme.jpg`, then restarting WallpaperAgent. This keeps the macOS "apply to all Spaces" mode intact, so every Space follows. One-time setup: open System Settings > Wallpaper, pick `current-theme.jpg`, and enable it for all Spaces. The script never calls System Events, which is what used to reset that mode. Setting the picture directly would only cover the focused Space.
- Every edit is guarded by an anchor check. If a file is missing, or a line was renamed and the pattern no longer matches, the script warns on stderr and skips that tool instead of failing silently.

## Adding a tool or changing a color

1. Add the file path near the top.
2. Set the per-theme value in the `gruvbox` and `sora` branches.
3. Wrap the edit in `anchor '<regex>' "$FILE" '<label>'` so it fails loud, not silent.

The script is macOS only: it relies on BSD `sed -i ''` and osascript.
