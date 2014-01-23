PathExtractor = require '../lib/path_extractor'

App.Translation = Ember.Object.extend
  init: ->
    @get 'allFields'
  
  seedLocale: (->
    @get 'seed_locale'
  ).property('seed_locale')
  
  allFields: (->
    extractor = new PathExtractor @get('seed_locale'), @get('translation'), @get('currentLocale')
    @set 'locales', extractor.locales
    @set 'fields', extractor.fields
    @get 'fields'
  ).property('translation', 'currentLocale')
  
  upToDateFields: (->
    @get('allFields').filterBy 'isUpToDate', true
  ).property('allFields.@each.isUpToDate')
  
  missingFields: (->
    @get('allFields').filterBy 'isMissing', true
  ).property('allFields.@each.isMissing')
  
  outOfDateFields: (->
    @get('allFields').filterBy 'isOutOfDate', true
  ).property('allFields.@each.isOutOfDate')
  
  todoFields: (->
    @get('allFields').filterBy 'isUpToDate', false
  ).property('allFields.@each.isUpToDate')
  
  selectedFields: (->
    @get "#{ @get('selectedType') }Fields"
  ).property('allFields', 'selectedType')
  
  progress: (->
    Math.round 100 * (@get('upToDateFields').length / @get('allFields').length)
  ).property('todoFields', 'allFields')


module.exports = App.Translation
