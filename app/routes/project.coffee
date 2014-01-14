AuthenticatedRoute = require './authenticated'

App.ProjectRoute = AuthenticatedRoute.extend
  model: (params) ->
    @store.find 'project', params.id
