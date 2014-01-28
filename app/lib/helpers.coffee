Ember.Handlebars.helper 'titleize', (text) ->
  new Handlebars.SafeString window.zooniverse.util.titleize(text)

Ember.Handlebars.helper 'localeNameOf', (code) ->
  window.zooniverse.util.localeCodes[code]
