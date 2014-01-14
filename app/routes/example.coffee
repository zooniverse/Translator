AuthenticatedRoute = require './authenticated'

App.ExampleRoute = AuthenticatedRoute.extend
  model: ->
    zooniverse.models.User.current
