
if exists('g:loaded_readme_viewer') || &cp
  finish
endif
let g:loaded_readme_viewer = v:true

let s:save_cpo = &cpo
set cpo&vim

let g:readme_viewer#plugin_manager = get(g:,
      \ 'readme_viewer#plugin_manager', 'dein.vim')

if g:readme_viewer#plugin_manager ==# 'dein.vim'
  command! -nargs=1 -bar -complete=customlist,readme_viewer#dein_completion
        \ DeinReadme call readme_viewer#dein(<q-args>)
elseif g:readme_viewer#plugin_manager ==# 'vim-plug'
  command! -nargs=1 -bar -complete=customlist,readme_viewer#plug_completion
        \ PlugReadme call readme_viewer#plug(<q-args>)
elseif g:readme_viewer#plugin_manager ==# 'minpac'
  command! -nargs=1 -bar -complete=customlist,readme_viewer#minpac_completion
        \ PackReadme call readme_viewer#minpac(<q-args>)
endif

augroup readme_viewer
  autocmd!
  autocmd User ReadmeOpen :
  if !get(g:, 'readme_viewer#no_mappings', v:false)
    autocmd User ReadmeOpen
          \ nnoremap <buffer> q <C-w>q
  endif
  if !get(g:, 'readme_viewer#no_buffer_commands', v:false)
    autocmd User ReadmeOpen
          \ command! -buffer -bar ReadmeHelp
          \ execute 'help' b:readme_data.normalized_name
  endif
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
