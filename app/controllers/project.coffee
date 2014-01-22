module.exports = App.ProjectController = Ember.Controller.extend
  currentLocale: null
  
  locales: (->
    @get 'model.translation.locales'
  ).property('model.translation.locales')
  
  localeDidChange: (->
    @set 'model.translation.currentLocale', @get('currentLocale')
  ).observes('currentLocale')
