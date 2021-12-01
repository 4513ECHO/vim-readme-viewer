if &compatible
  set nocompatible
endif

let s:cache = expand('%:p:h') .. '/cache/plug'
let s:repo_file = s:cache .. '/autoload/plug.vim'
let g:readme_viewer#plugin_manager = 'vim-plug'


if &runtimepath !~# s:cache
  if !filereadable(s:repo_file)
    call system('curl -fL --create-dirs ' ..
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
          \ .. ' -o ' .. s:repo_file)
  endif
  execute 'set runtimepath^=' .. s:cache
endif

call plug#begin(s:cache)

Plug 'junegunn/vim-plug'
Plug '4513ECHO/vim-readme-viewer'

call plug#end()
