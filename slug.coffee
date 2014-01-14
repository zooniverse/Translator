webmake = require 'webmake'
webmakeEco = require './node_modules/haw/lib/webmake-eco'
webmakeHandlebars = require 'webmake-ember-handlebars'

module.exports = ->
  @port = 9294
  
  @compile['.coffee']['.js'] = (sourceFile, options, callback) ->
    webmake sourceFile,
      ext: ['coffee', webmakeEco, webmakeHandlebars]
      sourceMap: true unless options.webmake?.sourceMap is false
      ignoreErrors: true unless options.webmake?.ignoreErrors is false
      callback
