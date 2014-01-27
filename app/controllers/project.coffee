Translation = require '../models/translation'

module.exports = App.ProjectController = Ember.Controller.extend
  currentLocale: null
  isNewLocaleVisible: false
  
  init: ->
    @userDidChange()
    zooniverse.models.User.on 'change', => @userDidChange()
  
  userDidChange: ->
    @set 'currentUser', zooniverse.models.User.current
  
  deployable: (->
    !!@get('devUser') and !!@get('currentLocale')
  ).property('devUser', 'currentLocale')
  
  devUser: (->
    currentUser = @get 'currentUser'
    currentUser?.admin or currentUser?.developer
  ).property('currentUser')
  
  locales: (->
    currentLocale = @get 'currentLocale'
    locales = @get 'model.translation.locales'
    locales.addObject(currentLocale) if currentLocale and locales.indexOf(currentLocale) is -1
    locales
  ).property('model.translation.locales')
  
  actions:
    deploy: ->
      zooniverse.api.post "/projects/#{ @get('model.name') }/translations/deploy", locale: @get('currentLocale'), ->
        alert 'Translation deployed'
    
    changeLocale: (locale) ->
      @set 'currentLocale', locale
      @set 'model.translation.currentLocale', locale
      setTimeout ->
        $('.project .locales li[data-locale]').removeClass 'active'
        $(".project .locales li[data-locale='#{ locale }']").addClass 'active'
      , 1
    
    toggleNewLocale: ->
      @set 'isNewLocaleVisible', not @get('isNewLocaleVisible')
    
    cancelNewLocale: ->
      @set 'newLocale', null
      @set 'isNewLocaleVisible', false
    
    createNewLocale: ->
      newLocale = @get('newLocale').toLowerCase().replace /[_ ]/, '-'
      @set 'newLocale', null
      locales = @get 'locales'
      
      isValidLocale = /(^[a-z]{2}$|^[a-z]{2}\-[a-z]{2}$)/.test newLocale
      unless isValidLocale
        alert "'#{ newLocale }' isn't a valid locale code\nValid formats look like 'en' or 'en-us'"
        return
      
      if locales.indexOf(newLocale) is -1
        locales.addObject newLocale
        @set 'currentLocale', newLocale
        @set 'model.translation.locales', locales
        @send 'changeLocale', newLocale
        @set 'isNewLocaleVisible', false
    
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
