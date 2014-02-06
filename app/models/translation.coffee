Field = require './field'

App.Translation = Ember.Object.extend
  init: ->
    @set 'allFields', []
    @set 'localeHash', { }
    @walk @, @get('translation')
    @_super()
  
  update: (json) ->
    for key, val of json.changes
      @addKey @, key, val
  
  walk: (self, hash, path) ->
    for own key, value of hash
      keyPath = [path, key].filter((k) -> !!k).join '.'
      if typeof value is 'object' and not value.__field
        self.walk self, value, keyPath
      else
        self.addKey self, keyPath, value
  
  addKey: (self, path, hash) ->
    hash = $.extend true, { }, hash
    delete hash.__field
    self.set("localeHash.#{ key }", true) for own key, value of hash
    
    fields = self.get 'allFields'
    existing = fields.findProperty 'path', path
    fields.removeObject(existing) if existing
    
    fields.pushObject Field.create
      projectTranslation: self
      seedLocale: self.get('seedLocale')
      path: path
      translations: hash
  
  seedLocale: (->
    @get 'seed_locale'
  ).property('seed_locale')
  
  locales: (->
    seedLocale = @get 'seedLocale'
    localeHash = @get 'localeHash'
    (key for key in Object.keys(localeHash) when key isnt seedLocale)
  ).property('seedLocale', 'localeHash')
  
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
  ).property('allFields.@each', 'selectedType')
  
  progress: (->
    Math.round 100 * (@get('upToDateFields').length / @get('allFields').length)
  ).property('todoFields', 'allFields')


module.exports = App.Translation
