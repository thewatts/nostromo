# Nostromo.nvim

A theme for Neovim based on the work done over at [Nostromo UI Themes](https://github.com/LegoYoda112/nostromo_ui_themes)

![Screenshot](./screenshot.png)

## Requirements

- Neovim >= 0.8.0
- True color terminal support

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "thewatts/nostromo.nvim",
  version = "0.0.6",
  lazy = false,
  priority = 1000,
  config = function()
    require("nostromo").setup()
  end,
}
```

## Configuration

```lua
require("nostromo").setup({
  -- Configuration options will go here
})
```

### Lualine

```lua
require('lualine').setup({
  options = {
    theme = require('nostromo').lualine
  }
})
```

## Ghostty

I have a PR open for Ghostty support, but if you want to add it directly to your config:

```
# Nostromo Theme

palette = 0=#141D22
palette = 1=#dd513c
palette = 2=#3df2ad
palette = 3=#ffb78a
palette = 4=#34A2DF
palette = 5=#eb78c3
palette = 6=#4DDCFF
palette = 7=#A5FBFF
palette = 8=#3a4c4e
palette = 9=#dd513c
palette = 10=#3df2ad
palette = 11=#ffb78a
palette = 12=#34A2DF
palette = 13=#eb78c3
palette = 14=#4DDCFF
palette = 15=#A5FBFF
background = #141D22
foreground = #A5FBFF
cursor-color = #A5FBFF
selection-background = #1e2628
selection-foreground = #A5FBFF
```
