App.Project = DS.Model.extend
  name: DS.attr()
  display_name: DS.attr()
  roles: DS.attr()
  
  userRoles: (->
    user = zooniverse.models.User.current.name
    userRoles = @get('roles').filter (role) -> role.name is user
    userRoles[0]?.roles or []
  ).property('roles')
  
  isTranslator: (->
    'translator' in @get('userRoles')
  ).property('userRoles')
  
  translation: (->
    @store.find('translation', @get('id'))
  ).property('id')

App.ProjectAdapter = App.ZooniverseAdapter.extend
  find: (store, type, id) ->
    @ajax "/projects/list/#{ id }", 'get'
  
  findAll: (store, type, sinceToken) ->
    @ajax '/projects/list', 'get'

App.ProjectSerializer = App.ApplicationSerializer.extend
  normalize: (type, hash) ->
    hash.id = hash.name
    @_super type, hash

module.exports = App.Project
