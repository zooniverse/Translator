AuthenticatedRoute = require './authenticated'
Project = require '../models/project'
Translation = require '../models/translation'

App.ProjectRoute = AuthenticatedRoute.extend
  model: (params) ->
    promises = Ember.RSVP.hash
      project: zooniverse.api.get("/projects/list/#{ params.name }", with_roles: true)
      translation: zooniverse.api.get("/projects/#{ params.name }/translations")
    
    promises.then (resolved) ->
      project = Project.create resolved.project
      project.set 'translation', Translation.create(resolved.translation)
      project
  
  setupController: (controller, project) ->
    controller.set 'model', project
    currentLocale = controller.get 'currentLocale'
    selectedType = controller.getWithDefault 'selectedType', 'todo'
    
    controller.set 'selectedType', selectedType
    controller.set 'model.translation.currentLocale', currentLocale
    controller.set 'model.translation.selectedType', selectedType
