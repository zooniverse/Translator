module.exports = App.Field = DS.Model.extend
  init: (hash) ->
    @set(key, value) for key, value of hash
    @set 'locales', Object.keys @get('translations')
    @set 'seed', @translations[@get('seedLocale')]
  
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
