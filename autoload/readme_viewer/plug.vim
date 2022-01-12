
function! readme_viewer#plug#open(plugin, mods) abort
  let plugin = readme_viewer#plug#get(a:plugin)
  if empty(plugin)
    call readme_viewer#error('Cannot find plugin name:', a:plugin)
    return
  endif
  call readme_viewer#open_buffer(plugin.path, plugin.name, a:mods)
endfunction

function! readme_viewer#plug#get(...) abort
  let plugins = a:0 > 0 ? get(g:plugs, a:1, {}) : g:plugs
  if empty(plugins)
    return {}
  endif
  if a:0 > 0
    return {'path': plugins.dir, 'name': a:1}
  else
    return map(copy(plugins), { key, val -> {'path': val.dir, 'name': key} })
  endif
endfunction

function! readme_viewer#plug#completion(ArgLead, CmdLine, CursorPos) abort
  if exists('?matchfuzzy')
    if empty(a:ArgLead)
      return sort(keys(g:plugs))
    else
      return matchfuzzy(sort(keys(g:plugs)), a:ArgLead)
    endif
  else
    return filter(sort(keys(g:plugs)), {_, val -> val =~? a:ArgLead})
endfunction

