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
      , 8000
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
      deployEndpoint = "/projects/#{ @get('model.name') }/translations/"
      deployEndpoint += if @get('deployable') then 'deploy' else 'test_deploy'

      localeName = zooniverse.util.localeCodes[@get('currentLocale')]
      zooniverse.api.post deployEndpoint, locale: @get('currentLocale'), (response) =>

        url = if @get('model.name') is 'galaxy_zoo'
          "http://#{ @get('model.bucket') }/?lang=#{ response.locale }"
        else
          "http://#{ @get('model.bucket') }?lang=./#{ @get('model.translation.deploy_path') }/#{ response.locale }.json"

        @set 'message', "#{ localeName } was successfully deployed. <a href=\"#{ url }\" target=\"blank\">View on site here.</a>"
      , =>
        @set 'message', "There was a problem deploying #{ localeName }.\nTry again in a moment."
    
    chooseLocale: (locale) ->
      @send 'changeLocale', locale
      @send 'cancelNewLocale'
    
    changeLocale: (locale) ->
      loadingIndicator = new Spinner().spin()
      document.querySelector('#app').appendChild loadingIndicator.el
      
      setTimeout =>
        @set 'currentLocale', locale
        @set 'model.translation.currentLocale', locale
        setTimeout ->
          loadingIndicator.stop()
          $('.project .locales li[data-locale]').removeClass 'active'
          $(".project .locales li[data-locale='#{ locale }']").addClass 'active'
        , 1
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
    
    copyText: (field) ->
      seedLocale = @get 'model.translation.seed_locale'
      field.set 'translatedText', field.get "translations.#{ seedLocale }.text"

    save: (field) ->
      change =
        locale: field.get('locale')
        translation: { }
      
      change.translation[field.get('path')] = field.get 'translatedText'
      zooniverse.api.put("/projects/#{ @get('model.name') }/translations", change).then (json) =>
        translation = @get 'model.translation'
        translation.update json
