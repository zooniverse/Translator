Ember.Handlebars.helper 'titleize', (text) ->
  new Handlebars.SafeString window.zooniverse.util.titleize(text)

Ember.Handlebars.helper 'downcasedTitle', (text) ->
  new Handlebars.SafeString window.zooniverse.util.titleize(text).toLowerCase()

Ember.Handlebars.helper 'localeNameOf', (code) ->
  window.zooniverse.util.localeCodes[code]
