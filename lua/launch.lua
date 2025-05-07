local module = {}

module.LAZY_PLUGIN_SPEC = {}

module.insert = function(plugin)
    table.insert(module.LAZY_PLUGIN_SPEC, { import = plugin })
end

return module
