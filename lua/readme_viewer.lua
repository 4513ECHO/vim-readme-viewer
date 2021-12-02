local readme_viewer = {}

-- packer.nvim

readme_viewer.packer = function(plugin)
  local plugin_data = _G.packer_plugins[plugin]
  if plugin_data == nil then
    vim.cmd(string.format(
      "echoerr 'Cannot find plugin name:' '%s'",
      plugin
    ))
    return
  end
  vim.fn['readme_viewer#open'](plugin_data.path, plugin)
end

readme_viewer.packer_completion = function(ArgLead, _, _)
  local completion_list = vim.tbl_filter(function(name)
    return vim.startswith(name, lead)
  end, vim.tbl_keys(_G.packer_plugins))
  table.sort(completion_list)
  return completion_list
end

return readme_viewer
