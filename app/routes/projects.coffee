AuthenticatedRoute = require './authenticated'

App.ProjectsRoute = AuthenticatedRoute.extend
  model: ->
    @store.find 'project'
