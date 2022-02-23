set nocompatible

let s:cache = expand('<sfile>:p:h') .. '/cache/packer'
let s:repo_dir = s:cache .. '/pack/packer/opt/packer.nvim'
let g:readme_viewer#plugin_manager = 'packer.nvim'

if &packpath !~# s:cache
  if !isdirectory(s:repo_dir)
    execute '!git clone https://github.com/wbthomason/packer.nvim'
          \ '--depth 1' s:repo_dir
  endif
  execute 'set packpath^=' .. s:cache
endif

lua << ENDLUA
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use '4513ECHO/vim-readme-viewer'
end)
ENDLUA

