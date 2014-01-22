PathExtractor = require '../lib/path_extractor'

App.Translation = Ember.Object.extend
  seedLocale: (->
    @get 'seed_locale'
  ).property('seed_locale')
  
  paths: (->
    @extractor = new PathExtractor @get('seed_locale'), @get('translation'), @get('currentLocale')
    @set 'locales', @extractor.locales
    @extractor.paths
  ).property('translation', 'currentLocale')

module.exports = App.Translation
