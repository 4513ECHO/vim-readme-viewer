# vim-readme-viewer

Please read [help](doc/readme_viewer.txt) for details.

Viewing plugin's README(.md) easily as vim help

![screenshot](img/screenshot.png)

## About

vim-readme-viewer help you to view some plugins' README(.md) file easily as
vim help. Viewing vim help is very easy. Only `:help topic`! This plugin usage
is also easy. If you are using [dein.vim](https://github.com/Shougo/dein.vim) please try:

```viml
:DeinReadme dein.vim
:DeinReadme vim-readme-viewer
" ... and other plugins
```

If you are using other plugin managers, please set:

```viml
let g:readme_viewer#plugin_manager = 'vim-plug'  " for vim-plug
let g:readme_viewer#plugin_manager = 'minpac'  " for minpac
```

and you can try:

```viml
:PlugReadme vim-readme-viewer  " for vim-plug
:PackReadme minpac  " for minpac
:PackReadme vim-readme-viewer
" ... and other plugins
```

**Note:** On default, vim-plug is not register itself as a plugin.
So, vim-readme-viewer cannot open vim-plug's README.md. If you want
to view vim-plug's README.md, you register vim-plug as a plugin.

```viml
Plug 'junegunn/vim-plug'
```

**Note:** This plugin is working with [dein.vim](https://github.com/Shougo/dein.vim),
[vim-plug](https://github.com/junegunn/vim-plug) and [minpac](
https://github.com/k-takata/minpac) now. I will supprt [packer.nvim](
https://github.com/wbthomason/packer.nvim).

## TODO

- Improve README.md and doc/readme_viewer.txt
- Support other plugin managers
  - [x] [dein.vim](https://github.com/Shougo/dein.vim)
  - [x] [vim-plug](https://github.com/junegunn/vim-plug)
  - [x] [minpac](https://github.com/k-takata/minpac)
  - [ ] [packer.nvim](https://github.com/wbthomason/packer.nvim)
