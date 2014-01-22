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
  
  translatedVersion: (->
    @get('translated')?.version
  ).property('translated')
  
  missing: (->
    not @get('translated')
  ).property('translated')
  
  outOfDate: (->
    not @get('missing') and @get('seedVersion') > @get('translatedVersion')
  ).property('missing', 'version', 'translatedVersion')
  
  upToDate: (->
    not @get('missing') and not @get('outOfDate')
  ).property('missing', 'outOfDate')
