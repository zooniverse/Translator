Translation = require './translation'

App.Project = Ember.Object.extend
  currentUser: (->
    window.zooniverse.models.User.current
  ).property('')
  
  isDeveloper: (->
    user = @get('currentUser')
    user.developer or user.admin
  ).property('currentUser')
  
  userRoles: (->
    user = @get('currentUser')
    userRoles = @get('roles').filter (role) -> role.name is user.name
    userRoles[0]?.roles or []
  ).property('roles')
  
  isTranslator: (->
    'translator' in @get('userRoles')
  ).property('userRoles')
  
  isAccessible: (->
    @get('isTranslator') or @get('isDeveloper')
  ).property('isTranslator', 'isDeveloper')

module.exports = App.Project
