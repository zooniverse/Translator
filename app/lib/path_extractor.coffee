Field = require '../models/field'

class PathExtractor
  constructor: (@seedLocale, json, @locale) ->
    @paths = []
    @walk json
  
  walk: (hash, path) =>
    for key, value of hash
      keyPath = [path, key].filter((k) -> !!k).join '.'
      if typeof value is 'object' and not value.field
        @walk value, keyPath
      else
        @addKey keyPath, value
  
  addKey: (path, hash) ->
    delete hash.field
    @paths.push new App.Field
      seedLocale: @seedLocale
      locale: @locale
      path: path
      translations: hash

module.exports = PathExtractor
