AuthenticatedRoute = require './authenticated'
Project = require '../models/project'
Translation = require '../models/translation'

App.ProjectRoute = AuthenticatedRoute.extend
  model: (params) ->
    promises = Ember.RSVP.hash
      project: zooniverse.api.get("/projects/list/#{ params.name }")
      translation: zooniverse.api.get("/projects/#{ params.name }/translations")
    
    promises.then (resolved) ->
      project = Project.create resolved.project
      project.set 'translation', Translation.create(resolved.translation)
      project
