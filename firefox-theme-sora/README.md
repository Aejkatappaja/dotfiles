# sora · firefox theme

sora palette applied to firefox chrome (tabs, toolbar, urlbar, sidebar, popups, ntp).

## install

### temporary (resets on restart)

1. open `about:debugging#/runtime/this-firefox`
2. click **load temporary add-on**
3. pick `~/.config/firefox-theme-sora/manifest.json`

### permanent (developer edition or nightly only)

1. set `xpinstall.signatures.required` to `false` in `about:config`
2. zip the dir contents (not the dir itself):
   ```bash
   cd ~/.config/firefox-theme-sora
   zip -r sora.xpi manifest.json
   ```
3. drag `sora.xpi` into firefox

### permanent (release/esr — requires signing)

submit to addons.mozilla.org for signing. heavy for a personal theme.

## palette mapped

| firefox slot               | sora token   | hex       |
| -------------------------- | ------------ | --------- |
| frame                      | bg_float     | `#0a0c12` |
| toolbar                    | bg           | `#0e1018` |
| toolbar_field              | bg_elevated  | `#14161e` |
| tab_selected               | bg           | `#0e1018` |
| tab_line (active accent)   | cyan         | `#80c8e0` |
| toolbar_field_border_focus | cyan         | `#80c8e0` |
| icons_attention (loading)  | gold         | `#d4b878` |
| sidebar                    | bg_float     | `#0a0c12` |
| popup_highlight            | bg_selection | `#1e2430` |
| ntp_background             | bg           | `#0e1018` |

## tweaks

edit `manifest.json` `theme.colors.*`. reload via `about:debugging` after change.
