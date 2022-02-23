set nocompatible

let s:cache = expand('<sfile>:p:h') .. '/cache/plug'
let s:repo_file = s:cache .. '/autoload/plug.vim'
let g:readme_viewer#plugin_manager = 'vim-plug'


if &runtimepath !~# s:cache
  if !filereadable(s:repo_file)
    execute '!curl -fL --create-dirs -o' s:repo_file
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
  execute 'set runtimepath^=' .. s:cache
endif

call plug#begin(s:cache)

Plug 'junegunn/vim-plug'
Plug '4513ECHO/vim-readme-viewer'

call plug#end()
