module.exports = App.LoginController = Ember.Controller.extend
  init: ->
    zooniverse.models.User.on 'change', => @userDidChange()
  
  userDidChange: ->
    return unless @get('active')
    transition = @get 'returnTo'
    if transition
      transition.retry()
    else
      @transitionToRoute 'index'
    
    @setProperties returnTo: null, active: false
