Translation = require './translation'

App.Project = Ember.Object.extend
  userRoles: (->
    user = zooniverse.models.User.current.name
    userRoles = @get('roles').filter (role) -> role.name is user
    userRoles[0]?.roles or []
  ).property('roles')
  
  isTranslator: (->
    'translator' in @get('userRoles')
  ).property('userRoles')

module.exports = App.Project
