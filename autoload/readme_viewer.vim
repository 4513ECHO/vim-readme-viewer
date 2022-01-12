let s:plugin_managers = {
      \ 'dein.vim': 'dein',
      \ 'vim-plug': 'plug',
      \ 'minpac': 'mimpac',
      \ 'packer.nvim': 'packer',
      \ }

let s:plugin_manager = s:plugin_managers[g:readme_viewer#plugin_manager]

function! readme_viewer#open_buffer(path, name, ...) abort
  let mods = a:0 > 0 ? a:1 : ''
  let open_help_buffer = get(g:, 'readme_viewer#open_help_buffer', v:true)
  let open_command = get(g:, 'readme_viewer#open_command', 'new')
  let readme = get(globpath(a:path, '\creadme*', v:false, v:true), 0, '')
  if !filereadable(readme)
    call readme_viewer#error('README file does not exists in this plugin')
    return
  endif
  if open_help_buffer
    helpclose
  endif
  execute mods 'keepalt' open_command readme
  if open_help_buffer
    setlocal buftype=help
  endif
  setlocal noswapfile nobuflisted readonly nomodified nomodifiable
  let normalized_name = substitute(
        \ fnamemodify(a:name, ':r'),
        \ '\v\c^%(n?vim|dps)[_-]|[_-]n?vim$', '', 'g')
  let b:readme_data = {
        \ 'path': a:path, 'name': a:name,
        \ 'normalized_name': normalized_name,
        \ }
  doautocmd <nomodeline> User ReadmeOpen
endfunction

function! readme_viewer#get(...) abort
  return a:0 > 0
        \ ? readme_viewer#{s:plugin_manager}#get(a:1)
        \ : readme_viewer#{s:plugin_manager}#get()
endfunction

function! readme_viewer#open(plugin, mods) abort
  call readme_viewer#{s:plugin_manager}#open(a:plugin, a:mods)
endfunction

function! readme_viewer#error(msg, ...) abort
  echohl ErrorMsg
  echomsg '[readme-viewer]:' a:msg join(a:000)
  echohl None
endfunction

