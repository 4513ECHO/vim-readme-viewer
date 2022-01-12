
function! readme_viewer#dein#open(plugin, mods) abort
  let plugin = readme_viewer#dein#get(a:plugin)
  if empty(plugin)
    call readme_viewer#error('Cannot find plugin name:', a:plugin)
    return
  endif
  call readme_viewer#open_buffer(plugin.path, plugin.name, a:mods)
endfunction

function! readme_viewer#dein#get(...) abort
  let plugins = a:0 > 0 ? dein#get(a:1) : dein#get()
  if empty(plugins)
    return {}
  endif
  if a:0 > 0
    return {'path': plugins.path, 'name': plugins.name}
  else
    return map(plugins, { _, val -> {'path': val.path, 'name': val.name} })
  endif
endfunction

function! readme_viewer#dein#completion(ArgLead, CmdLine, CursorPos) abort
  if exists('?matchfuzzy')
    if empty(a:ArgLead)
      return sort(keys(dein#get()))
    else
      return matchfuzzy(sort(keys(dein#get())), a:ArgLead)
    endif
  else
    return filter(sort(keys(dein#get())), {_, val -> val =~? a:ArgLead})
  endif
endfunction

