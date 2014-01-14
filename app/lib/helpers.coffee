translate = require 't7e'

Ember.Handlebars.helper 'formatNumber', (number) ->
  new Handlebars.SafeString window.zooniverse.util.formatNumber(number)

Ember.Handlebars.registerHelper 'translate', (args..., emberOptions) ->
  new Handlebars.SafeString translate args...
