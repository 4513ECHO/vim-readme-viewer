
function! readme_viewer#minpac#open(plugin, mods) abort
  let plugin = readme_viewer#minpac#get(a:plugin)
  if empty(plugin)
    call readme_viewer#error('Cannot find plugin name:', a:plugin)
    return
  endif
  call readme_viewer#open_buffer(plugin.path, plugin.name, a:mods)
endfunction

function! readme_viewer#minpac#get(...) abort
  let plugins = a:0 > 0 ? minpac#getpluginfo(a:1) : minpac#getpluglist()
  if empty(plugins)
    return {}
  endif
  if a:0 > 0
    return {'path': plugins.dir, 'name': plugins.name}
  else
    return map(plugins, { _, val -> {'path': val.dir, 'name': val.name} })
  endif
endfunction

function! readme_viewer#minpac#completion(ArgLead, CmdLine, CursorPos) abort
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

