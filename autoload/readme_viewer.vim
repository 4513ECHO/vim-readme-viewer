function! readme_viewer#open(path, name) abort
  let open_help_buffer = get(g:, 'readme_viewer#open_help_buffer', v:true)
  let readme = get(split(globpath(a:path, '\creadme.*'), '\n'), 0, '')
  if filereadable(readme)
    " TODO: support vertical
    execute 'keepalt new' readme
    if open_help_buffer
      helpclose
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
  else
    echoerr 'README file does not exists in this plugin'
  endif
endfunction

function! readme_viewer#dein(plugin) abort
  let plugin = dein#get(a:plugin)
  if empty(plugin)
    echoerr 'Cannot find plugin name:' a:plugin
    return
  endif
  call readme_viewer#open(plugin.path, plugin.name)
endfunction

function! readme_viewer#dein_completion(ArgLead, CmdLine, CursorPos) abort
  if empty(a:ArgLead)
    return sort(keys(dein#get()))
  else
    return matchfuzzy(sort(keys(dein#get())), a:ArgLead)
  endif
endfunction

