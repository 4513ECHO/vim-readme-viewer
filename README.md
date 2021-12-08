# vim-readme-viewer

Please read [help](doc/readme_viewer.txt) for details.

> Viewing plugin's README(.md) easily like vim help

![screenshot](img/screenshot.gif)

## About

vim-readme-viewer help you to view some plugins' README(.md) file easily like
vim help. Viewing vim help is very easy. Only `:help topic`! This plugin usage
is also easy. If you are using [dein.vim](https://github.com/Shougo/dein.vim)
please try:

```vim
:DeinReadme dein.vim
:DeinReadme vim-readme-viewer
" ... and other plugins
```

If you are using other plugin managers, please try:

```vim
:PlugReadme vim-readme-viewer  " for vim-plug
:PackReadme vim-readme-viewer  " for minpac
:PackerReadme vim-readme-viewer  " for packer.nvim
" ... and other plugins
```

**Note:** Basically vim-readme-viewer automatically judge your using plugin
manager. However, it sometimes may fail. I recommend that you set manually
`g:readme_viewer#plugin_manager` to plugin manager.

```vim
let g:readme_viewer#plugin_manager = 'vim-plug'  " for vim-plug
let g:readme_viewer#plugin_manager = 'minpac'  " for minpac
```

**Note:** On default, vim-plug is not register itself as a plugin.
So, vim-readme-viewer cannot open vim-plug's README.md. If you want
to view vim-plug's README.md, you register vim-plug as a plugin.

```vim
Plug 'junegunn/vim-plug'
```

**Note:** This plugin is working with [dein.vim](https://github.com/Shougo/dein.vim),
[vim-plug](https://github.com/junegunn/vim-plug), [minpac](
https://github.com/k-takata/minpac) and [packer.nvim](
https://github.com/wbthomason/packer.nvim) now.

## TODO

- Improve README.md and doc/readme_viewer.txt
- Support other plugin managers
  - [ ] runtimepath based plugin manager
  - [ ] buildin package system based plugin manager
  - [x] [dein.vim](https://github.com/Shougo/dein.vim)
  - [x] [vim-plug](https://github.com/junegunn/vim-plug)
  - [x] [minpac](https://github.com/k-takata/minpac)
  - [x] [packer.nvim](https://github.com/wbthomason/packer.nvim)
