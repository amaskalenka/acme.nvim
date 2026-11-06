# acme.nvim

Acme colorscheme for Neovim, a Lua port of
[plan9-for-vimspace/acme-colors](https://github.com/plan9-for-vimspace/acme-colors).

Pale yellow background, black text, emphasis through bold and italic only.
Works with truecolor and 256-color terminals.

## Install

lazy.nvim:

```lua
{ "amaskalenka/acme.nvim", lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme("acme") end }
```

Manual install, since `colors/acme.lua` is the only file:

```sh
mkdir -p ~/.config/nvim/colors
curl -fLo ~/.config/nvim/colors/acme.lua \
  https://raw.githubusercontent.com/amaskalenka/acme.nvim/main/colors/acme.lua
```

Then add `vim.cmd.colorscheme("acme")` to your `init.lua`.

## Differences from the original

- `fg` and `bg` color names are resolved to concrete values.
- `NormalFloat`, `FloatBorder`, `SignColumn` and `EndOfBuffer` are added so
  Neovim UI elements match the theme.
- `NonText` was defined twice in the original; the later definition (bold) is kept.

