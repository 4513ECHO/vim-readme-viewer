if &compatible
  set nocompatible
endif

let s:cache = expand('%:p:h') .. '/cache/packer'
let s:repo_dir = s:cache .. '/pack/packer/opt/packer.nvim'
let g:readme_viewer#plugin_manager = 'packer.nvim'

if &packpath !~# s:cache
  if !isdirectory(s:repo_dir)
    call system('git clone https://github.com/wbthomason/packer.nvim '
          \ .. s:repo_dir)
  endif
  execute 'set packpath^=' .. s:cache
endif

lua << ENDLUA
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use '4513ECHO/vim-readme-viewer'
end)
ENDLUA

echomsg 'Please execute :PackerInstall'
