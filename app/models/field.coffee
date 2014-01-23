module.exports = App.Field = Ember.Object.extend
  locales: (->
    Object.keys @getWithDefault('translations', { })
  ).property('translations')
  
  seed: (->
    @get('translations')[@get('seedLocale')]
  ).property('translations', 'seedLocale')
  
  version: (->
    @get('seed').version
  ).property('seed')
  
  translated: (->
    @get('translations')[@get('locale')]
  ).property('translations', 'locale')
  
  translatedText: ((key, value) ->
    if value
      current = @get 'translated'
      
      if current
        @set "translations.#{ @get('locale') }.text", value
      else
        @set "translations.#{ @get('locale') }", { text: value }
      
      value
    else
      @get 'translated.text'
  ).property('translated')
  
  translatedVersion: (->
    @get('translated')?.version
  ).property('translated')
  
  isMissing: (->
    not @get('translated')
  ).property('translated')
  
  isOutOfDate: (->
    not @get('isMissing') and @get('seed.version') > @get('translatedVersion')
  ).property('isMissing', 'seed', 'translatedVersion')
  
  isUpToDate: (->
    not @get('isMissing') and not @get('isOutOfDate')
  ).property('isMissing', 'isOutOfDate')
