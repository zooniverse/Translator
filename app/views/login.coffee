module.exports = App.LoginView = Ember.View.extend
  afterRenderEvent: ->
    @get('controller').set 'active', true
    new zooniverse.controllers.LoginForm el: @$('.sign-in-form')
