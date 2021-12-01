if &compatible
  set nocompatible
endif

let s:cache = expand('%:p:h') .. '/cache/dein'
let s:repo_dir = s:cache .. '/repos/github.com/Shougo/dein.vim'
let g:readme_viewer#plugin_manager = 'dein.vim'

if &runtimepath !~# s:cache
  if !isdirectory(s:repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim '
          \ .. s:repo_dir)
  endif
  execute 'set runtimepath^=' .. s:repo_dir
endif

call dein#begin(s:cache)

call dein#add('Shougo/dein.vim')
call dein#add('4513ECHO/vim-readme-viewer')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
