if &compatible
  set nocompatible
endif

let s:cache = expand('%:p:h') .. '/cache/minpac'
let s:repo_dir = s:cache .. '/pack/minpac/opt/minpac'
let g:readme_viewer#plugin_manager = 'minpac'

if &packpath !~# s:cache
  if !isdirectory(s:repo_dir)
    call system('git clone https://github.com/k-takata/minpac '
          \ .. s:repo_dir)
  endif
  execute 'set packpath^=' .. s:cache
endif

packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('4513ECHO/vim-readme-viewer')

packloadall
filetype plugin indent on
syntax enable

call minpac#update()
