Ember.View.reopen
  didInsertElement: ->
    @_super()
    Ember.run.scheduleOnce 'afterRender', @, @afterRenderEvent
  
  afterRenderEvent: $.noop

window.App = Ember.Application.create
  rootElement: '#app'
  LOG_TRANSITIONS: true
