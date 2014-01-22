module.exports = App.Field = DS.Model.extend
  seedLocale: DS.attr()
  locale: DS.attr()
  path: DS.attr()
  translation_id: DS.attr()
  translations: DS.attr('object')
  translation: DS.belongsTo('translation')
  
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
