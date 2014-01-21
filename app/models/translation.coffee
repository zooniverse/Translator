PathExtractor = require '../lib/path_extractor'

App.Translation = DS.Model.extend
  seed_locale: DS.attr()
  translation: DS.attr()
  
  seedLocale: (->
    @get 'seed_locale'
  ).property('seed_locale')
  
  paths: (->
    extractor = new PathExtractor @get('seed_locale'), @get('translation'), @get('currentLocale')
    extractor.paths
  ).property('translation', 'currentLocale')

App.TranslationAdapter = App.ZooniverseAdapter.extend
  find: (store, type, id) ->
    @ajax "/projects/#{ id }/translations", 'get'

module.exports = App.Translation
