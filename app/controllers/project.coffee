Translation = require '../models/translation'

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
      @set 'selectedType', type
      @get('model.translation').set 'selectedType', type
    
    reloadModel: ->
      @transitionToRoute 'project', @get('model.name')
    
    save: (field) ->
      change =
        locale: field.get('locale')
        translation: { }
      
      change.translation[field.get('path')] = field.get 'translatedText'
      zooniverse.api.put("/projects/#{ @get('model.name') }/translations", change).then (json) =>
        translation = Translation.create json
        translation.set 'currentLocale', @get('currentLocale')
        translation.set 'selectedType', @get('selectedType')
        @set 'model.translation', translation
