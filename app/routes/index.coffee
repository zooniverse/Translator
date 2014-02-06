AuthenticatedRoute = require './authenticated'

App.IndexRoute = AuthenticatedRoute.extend
  redirect: ->
    @transitionTo 'projects'
