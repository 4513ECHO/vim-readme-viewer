
function! readme_viewer#jetpack#open(plugin, mods) abort
  let plugin = readme_viewer#jetpack#get(a:plugin)
  if empty(plugin)
    call readme_viewer#error('Cannot find plugin name:', a:plugin)
    return
  endif
  call readme_viewer#open_buffer(plugin.path, plugin.name, a:mods)
endfunction

function! readme_viewer#jetpack#get(...) abort
  let plugins = a:0 > 0 ? jetpack#get(a:1) : jetpack#names()
  if empty(plugins)
    return {}
  endif
  if a:0 > 0
    return {'path': plugins.path, 'name': plugins.name}
  else
    let dict = {}
    for pkg in plugins
      let info = jetpack#get(pkg)
      call extend(dict, {info.name: {
          \ 'path': info.path,
          \ 'name': info.name,
          \ }})
    endfor
    return dict
  endif
endfunction

function! readme_viewer#jetpack#completion(ArgLead, CmdLine, CursorPos) abort
  if exists('*matchfuzzy')
    if empty(a:ArgLead)
      return sort(jetpack#names())
    else
      return matchfuzzy(sort(jetpack#names()), a:ArgLead)
    endif
  else
    return filter(sort(jetpack#names()),
          \ {_, val -> val =~? a:ArgLead})
  endif
endfunction

