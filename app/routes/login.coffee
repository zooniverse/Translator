module.exports = App.LoginRoute = Ember.Route.extend
  actions:
    willTransition: (transition) ->
      @controllerFor('login').setProperties returnTo: null, active: false
