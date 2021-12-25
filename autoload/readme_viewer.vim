function! readme_viewer#open(path, name) abort
  let open_help_buffer = get(g:, 'readme_viewer#open_help_buffer', v:true)
  let open_command = get(g:, 'readme_viewer#open_command', 'new')
  let readme = get(globpath(a:path, '\creadme*', v:false, v:true), 0, '')
  if !filereadable(readme)
    echoerr 'README file does not exists in this plugin'
    return
  endif
  " TODO: support vertical
  if open_help_buffer
    helpclose
  endif
  execute 'keepalt' open_command readme
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

" dein.vim

function! readme_viewer#dein(plugin) abort
  let plugin = dein#get(a:plugin)
  if empty(plugin)
    echoerr 'Cannot find plugin name:' a:plugin
    return
  endif
  call readme_viewer#open(plugin.path, plugin.name)
endfunction

function! readme_viewer#dein_completion(ArgLead, CmdLine, CursorPos) abort
  if exists('?matchfuzzy')
    if empty(a:ArgLead)
      return sort(keys(dein#get()))
    else
      return matchfuzzy(sort(keys(dein#get())), a:ArgLead)
    endif
  else
    return filter(sort(keys(dein#get())), {_, val -> val =~? a:ArgLead})
endfunction

" vim-plug

function! readme_viewer#plug(plugin) abort
  let plugin = get(g:plugs, a:plugin, {})
  if empty(plugin)
    echoerr 'Cannot find plugin name:' a:plugin
    return
  endif
  call readme_viewer#open(plugin.dir, a:plugin)
endfunction

function! readme_viewer#plug_completion(ArgLead, CmdLine, CursorPos) abort
  if exists('?matchfuzzy')
    if empty(a:ArgLead)
      return sort(keys(g:plugs))
    else
      return matchfuzzy(sort(keys(g:plugs)), a:ArgLead)
    endif
  else
    return filter(sort(keys(g:plugs)), {_, val -> val =~? a:ArgLead})
endfunction

" minpac

function! readme_viewer#minpac(plugin) abort
  let plugin = minpac#getpluginfo(a:plugin)
  if empty(plugin)
    echoerr 'Cannot find plugin name:' a:plugin
    return
  endif
  call readme_viewer#open(plugin.dir, plugin.name)
endfunction

function! readme_viewer#minpac_completion(ArgLead, CmdLine, CursorPos) abort
  if exists('?matchfuzzy')
    if empty(a:ArgLead)
      return sort(keys(minpac#getpluglist()))
    else
      return matchfuzzy(sort(keys(minpac#getpluglist())), a:ArgLead)
    endif
  else
    return filter(sort(keys(minpac#getpluglist())),
          \ {_, val -> val =~? a:ArgLead})
endfunction

