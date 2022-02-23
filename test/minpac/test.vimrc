  set nocompatible

let s:cache = expand('<sfile>:p:h') .. '/cache/minpac'
let s:repo_dir = s:cache .. '/pack/minpac/opt/minpac'
let g:readme_viewer#plugin_manager = 'minpac'

if &packpath !~# s:cache
  if !isdirectory(s:repo_dir)
    execute '!git clone https://github.com/k-takata/minpac'
          \ '--depth 1' s:repo_dir
  endif
  execute 'set packpath^=' .. s:cache
endif

packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('4513ECHO/vim-readme-viewer')

packloadall
