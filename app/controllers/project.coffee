module.exports = App.ProjectController = Ember.Controller.extend
  currentLocale: null
  
  locales: (->
    @get 'model.translation.locales'
  ).property('model.translation.locales')
  
  localeDidChange: (->
    @set 'model.translation.currentLocale', @get('currentLocale')
  ).observes('currentLocale')
  
  actions:
    chooseType: (type) ->
      $('.project .types li').removeClass 'active'
      $(".project .types [data-type='#{ type }']").addClass 'active'
      @get('model.translation').set 'selectedType', type
