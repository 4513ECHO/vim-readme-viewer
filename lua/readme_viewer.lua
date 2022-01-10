local readme_viewer = {}

-- packer.nvim

readme_viewer.packer = function(plugin, mods)
  if _G.packer_plugins == nil then
    vim.fn['readme_viewer#error'](
      '_G.packer_plugins is undefined yet. Did you forget :PackerCompile?'
    )
    return
  end
  local plugin_data = _G.packer_plugins[plugin]
  if plugin_data == nil then
    vim.fn['readme_viewer#error']('Cannot find plugin name:', plugin)
    return
  end
  if plugin_data.path == nil then
    vim.fn['readme_viewer#error']('Plugins path is emtpy')
    return
  end
  vim.fn['readme_viewer#open'](plugin_data.path, plugin, mods)
end

readme_viewer.packer_completion = function(ArgLead, _, _)
  if _G.packer_plugins == nil then
    return ""
  end
  local completion_list = vim.tbl_filter(function(name)
    return vim.startswith(name, ArgLead)
  end, vim.tbl_keys(_G.packer_plugins))
  table.sort(completion_list)
  return completion_list
end

return readme_viewer
