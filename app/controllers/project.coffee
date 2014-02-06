Translation = require '../models/translation'

module.exports = App.ProjectController = Ember.Controller.extend
  currentLocale: null
  isNewLocaleVisible: false
  message: null
  newLocale: null
  
  init: ->
    @userDidChange()
    zooniverse.models.User.on 'change', => @userDidChange()
  
  userDidChange: ->
    @set 'currentUser', zooniverse.models.User.current
  
  messageDidChange: (->
    if @get('message')
      setTimeout =>
        @set 'message', null
      , 5000
  ).observes('message')
  
  newLocaleDidChange: (->
    search = @get 'newLocale'
    if search and search.length > 2
      matcher = new RegExp search, 'i'
      seedLocale = @get 'model.translation.seed_locale'
      @set 'localeSearchResults', zooniverse.util.locales.filter (locale) ->
        if locale.code is seedLocale
          false
        else
          locale.code.match(matcher) or locale.name.match(matcher)
    else
      @set 'localeSearchResults', null
  ).observes('newLocale')
  
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
      localeName = zooniverse.util.localeCodes[@get('currentLocale')]
      zooniverse.api.post "/projects/#{ @get('model.name') }/translations/deploy", locale: @get('currentLocale'), =>
        @set 'message', "#{ localeName } was successfully deployed"
      , =>
        @set 'message', "There was a problem deploying #{ localeName }.\nTry again in a moment."
    
    chooseLocale: (locale) ->
      @send 'changeLocale', locale
      @send 'cancelNewLocale'
    
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
        translation = @get 'model.translation'
        translation.update json
