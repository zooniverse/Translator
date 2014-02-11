AuthenticatedRoute = require './authenticated'
Project = require '../models/project'

App.ProjectsRoute = AuthenticatedRoute.extend
  model: ->
    zooniverse.api.get('/projects/list', with_roles: true).then (projects) ->
      Project.create(project) for project in projects
