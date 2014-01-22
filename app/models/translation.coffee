PathExtractor = require '../lib/path_extractor'

App.Translation = DS.Model.extend
  seed_locale: DS.attr()
  translation: DS.attr()
  fields: DS.hasMany 'field'
  
  seedLocale: (->
    @get 'seed_locale'
  ).property('seed_locale')
  
  paths: (->
    if @extractor
      path.deleteRecord(path) for path in @extractor.paths
    
    @extractor = new PathExtractor @store, @get('id'), @get('seed_locale'), @get('translation'), @get('currentLocale')
    @set 'locales', @extractor.locales
    @extractor.paths
  ).property('translation', 'currentLocale')

App.TranslationAdapter = App.ZooniverseAdapter.extend
  find: (store, type, id) ->
    @ajax "/projects/#{ id }/translations", 'get'

module.exports = App.Translation
